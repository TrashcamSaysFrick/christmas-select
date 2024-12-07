-- name: [CS] Christmas Select
-- description: A Character Select Collab Pack for the Holiday Season!

local TEXT_MOD_NAME = "Christmas Select"

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

local E_MODEL_WHITEY = smlua_model_util_get_id("Whitey_geo")

local TEX_WHITEY_LIFE_ICON = get_texture_info("whitey") -- Located in "textures"

local VOICETABLE_WHITEY = {
    [CHAR_SOUND_ATTACKED] = 'WhiteyHurtAAA.ogg',
    [CHAR_SOUND_DOH] = 'WhiteyHurtOh.ogg',
    [CHAR_SOUND_DROWNING] = nil,
    [CHAR_SOUND_DYING] = nil,
    [CHAR_SOUND_GROUND_POUND_WAH] = nil,
    [CHAR_SOUND_HAHA] = nil,
    [CHAR_SOUND_HAHA_2] = nil,
    [CHAR_SOUND_HERE_WE_GO] = 'Technical-Foul.ogg',
    [CHAR_SOUND_HOOHOO] = 'EEE.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'This-Might-Be-Harder-Than-I-Thought.ogg',
    [CHAR_SOUND_OKEY_DOKEY] = 'Technical-Foul.ogg',
    [CHAR_SOUND_ON_FIRE] = 'WhiteyHurtAAA.ogg',
    [CHAR_SOUND_OOOF] = 'WhiteyHurtUgh.ogg',
    [CHAR_SOUND_OOOF2] = 'WhiteyHurtAugh.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'AAA.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'Wah.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'YEAAAH.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'Technical-Foul.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'Yeahsadeh.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'WhiteyHurtAAA.ogg',
    [CHAR_SOUND_WAH2] = nil,
    [CHAR_SOUND_WHOA] = nil,
    [CHAR_SOUND_YAHOO] = 'Dont-Forget.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'Dont-Forget.ogg', 'Wah.ogg', 'YEAAAH.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'YEAAAH.ogg', 'Wah.ogg', 'AAA.ogg'},
    [CHAR_SOUND_YAWNING] = nil,
}

local PALETTE_WHITEY = {
    [PANTS]  = "0066cc",
    [SHIRT]  = "feebf7",
    [GLOVES] = "fddfdb",
    [SHOES]  = "ff2d32",
    [HAIR]   = "51a5ed",
    [SKIN]   = "fddfdb",
    [CAP]    = "ff2d32",
    [EMBLEM] = "ff2d32",
}

local CSloaded = false
local function on_character_select_load()
    CT_WHITEY = _G.charSelect.character_add("Whitey", {"Whitey Duvall from Adam Sandler's Eight Crazy Nights", "is now here."}, "Trashcam", {r = 255, g = 200, b = 200}, E_MODEL_WHITEY, CT_MARIO, TEX_WHITEY_LIFE_ICON)
    _G.charSelect.character_add_voice(E_MODEL_WHITEY, VOICETABLE_WHITEY)
    _G.charSelect.character_add_palette_preset(E_MODEL_WHITEY, PALETTE_WHITEY)
    CSloaded = true
end

local function on_character_sound(m, sound)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_WHITEY then return _G.charSelect.voice.sound(m, sound) end
end

local function on_character_snore(m)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_WHITEY then return _G.charSelect.voice.snore(m) end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
hook_event(HOOK_MARIO_UPDATE, on_character_snore)