---@shape TradeSkillsData
---@field AMOUNT_RANKS table<ProfessionId, number>
---@field MIN_PATCH_LEVEL Phase
---@field MAX_PATCH_LEVEL Phase
---@field CURRENT_PATCH_LEVEL Phase
---@field PHASE_IDS number[]
---@field continents Entity[]
---@field factions Entity[]
---@field holidays Holiday[]
---@field items table<ProfessionId, Item[]>
---@field levels table<ProfessionId, ProfessionLevel[]>
---@field npcs NPC[]
---@field objects Object[]
---@field professions table<ProfessionId, Entity>
---@field profession_ranks table<string, Entity>
---@field quests Quest[]
---@field reputation_levels Entity[]
---@field skills table<ProfessionId, Skill[]>
---@field special_actions table<string, Entity>
---@field specialisations table<ProfessionId, Specialisation[]>
---@field zones Zone[]


------------------------------------------------- Shared -------------------------------------------------
---@alias ProfessionId "Alchemy" | "Blacksmithing" | "Cooking" | "Enchanting" | "Engineering" | "First Aid" | "Fishing" | "Herbalism" | "Leatherworking" | "Mining" | "Poisons" | "Skinning" | "Tailoring"

---@alias Language "Chinese" | "English" | "French" | "German" | "Korean" | "Mexican" | "Portuguese" | "Russian" | "Spanish" | "Taiwanese"
---@alias Translation table<Language, string>

---@alias Phase 1 | 2 | 3 | 4 | 5 | 6

---@shape LevelRange
---@field min number
---@field max number

---@shape Location
---@field x string
---@field y string

---@shape EmptyLocation: Location
---@field x "-"
---@field y "-"

---@shape Entity
---@field id number
---@field name Translation


------------------------------------------------- Holidays -------------------------------------------------
---@shape Holiday: Entity
---@field phase Phase


---------------------------------------------------- Items -------------------------------------------------
---@shape ItemLevelRange
---@field min_xp_level number
---@field max_xp_level number

---@shape ItemDropInfo
---@field range ItemLevelRange|nil
---@field sources number[]|nil

---@shape Item: Entity
---@field quality "common" | "uncommon" | "rare" | "epic"
---@field phase Phase
---@field drops ItemDropInfo|nil
---@field quests number[]|nil
---@field vendors VendorsInfo|nil
---@field special_action string|nil
---@field reputation ReputationInfo|nil

---@shape VendorsInfo
---@field price number
---@field sources number[]

---@shape ReputationInfo
---@field faction_id number
---@field level_id number


------------------------------------------------- Levels -------------------------------------------------
---@shape ProfessionLevel: Entity
---@field min_skill number
---@field max_skill number
---@field min_xp_level number
---@field phase Phase
---@field rank number
---@field trainers TrainersInfo|nil

---@shape TrainersInfo
---@field price number
---@field sources number[]


------------------------------------------------- NPCs -------------------------------------------------
---@alias Reaction "Alliance" | "Horde" | "Hostile" | "Neutral"

---@shape NPCLevelInfo
---@field min number | "??"
---@field max number | "??"
---@field is_elite 0 | 1

---@shape NPC: Entity
---@field phase Phase
---@field reacts Reaction
---@field xp_level NPCLevelInfo
---@field zone_id number

---@shape WorldNPC: NPC
---@field location Location

------------------------------------------------- Objects -------------------------------------------------
---@shape Object: Entity
---@field location Location
---@field phase Phase
---@field zone_id number


------------------------------------------------- Quests -------------------------------------------------
---@shape Quest: Entity
---@field min_xp_level number
---@field phase Phase

---@shape NpcQuest: Quest
---@field npcs number[]

---@shape ObjectQuest: Quest
---@field objects number[]

---@shape ItemQuest: Quest
---@field items number[]

---@shape SpecialActionQuest: Quest
---@field special_action string


------------------------------------------------- Skills -------------------------------------------------
---@shape Skill: Entity
---@field min_skill number
---@field phase Phase
---@field items number[]|nil
---@field trainers TrainersInfo|nil
---@field special_action string|nil


------------------------------------------------- Specialisations -------------------------------------------------
---@shape Specialisation: Entity
---@field min_skill number
---@field phase Phase
---@field quests number[]


------------------------------------------------- Zones -------------------------------------------------
---@shape Zone: Entity
---@field cont_id number
---@field levels LevelRange
