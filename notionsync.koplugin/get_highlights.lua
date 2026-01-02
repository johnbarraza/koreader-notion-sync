local md5 = require("ffi/sha2").md5

local GetHighlights = {}

-- Main processing function
-- Returns: payload (table) OR nil
function GetHighlights.transform(doc, raw_annotations)
    if not doc then return nil, "No document" end
    if not raw_annotations or next(raw_annotations) == nil then return nil, "No annotations" end

    -- 1. Get Book Metadata
    local props = doc:getProps()
    local book_title = props.title or "Unknown Title"
    -- Try multiple casing/plural variations for safety
    local raw_author = props.authors or props.author or props.Authors or props.Author
    local book_author = "Unknown Author"
    
    if type(raw_author) == "table" then
        book_author = table.concat(raw_author, "; ")
    elseif type(raw_author) == "string" and raw_author ~= "" then
        -- Normalize separators: " & " -> "; "
        book_author = raw_author:gsub(" & ", "; "):gsub(" and ", "; ")
    end
    
    -- Extract ISBN from identifiers string (e.g. "ISBN:978...")
    local book_isbn = props.isbn
    if not book_isbn and props.identifiers then
        book_isbn = props.identifiers:match("ISBN:(%d+)")
    end
    book_isbn = book_isbn or ""

    -- Extract Language
    local book_language = props.language or "Unknown"
    
    local file_path = doc.file or ""

    -- 2. Transform Data
    local clean_highlights = {}
    
    for _, item in pairs(raw_annotations) do
        -- Generate ID: md5(filepath + datetime)
        local created_at = item.datetime or ""
        local id_source = file_path .. created_at
        local unique_id = md5(id_source)

        -- Handle Updated At logic
        local updated_at = item.datetime_updated
        if not updated_at or updated_at == "" then
            updated_at = created_at
        end

        local entry = {
            id = unique_id,
            chapter = item.chapter or "",
            text = item.text or "",
            page = item.pageno or item.page,
            note = item.note, -- Lua ignores if nil
            created_at = created_at,
            updated_at = updated_at
        }

        table.insert(clean_highlights, entry)
    end

    -- 3. Return Final Payload
    return {
        author = book_author,
        title = book_title,
        isbn = book_isbn,
        language = book_language,
        highlights = clean_highlights
    }
end

return GetHighlights