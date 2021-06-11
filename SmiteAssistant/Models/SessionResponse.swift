//
//  CreateSessionResponse.swift
//  SmiteAssistant
//
//  Created by Levi Carpenter on 6/10/21.
//

import Foundation

struct SessionResponse : Codable {
    let ret_msg: String?
    
    // createsession
    let session_id: String?
    let timestamp: String?
    
    // getgods
    let Ability1: String?
    let Ability2: String?
    let Ability3: String?
    let Ability4: String?
    let Ability5: String?
    let AbilityId1: Int?
    let AbilityId2: Int?
    let AbilityId3: Int?
    let AbilityId4: Int?
    let AbilityId5: Int?
    let Ability_1: GodAbility?
    let Ability_2: GodAbility?
    let Ability_3: GodAbility?
    let Ability_4: GodAbility?
    let Ability_5: GodAbility?
    let AttackSpeed: Float?
    let AttackSpeedPerLevel: Float?
    let AutoBanned: String?
    let Cons: String?
    let HP5PerLevel: Float?
    let Health: Float?
    let HealthPerFive: Float?
    let HealthPerLevel: Float?
    let Lore: String?
    let MP5PerLevel: Float?
    let MagicProtection: Float?
    let MagicProtectionPerLevel: Float?
    let MagicalPower: Float?
    let MagicalPowerPerLevel: Float?
    let Mana: Float?
    let ManaPerFive: Float?
    let ManaPerLevel: Float?
    let Name: String?
    let OnFreeRotation: String?
    let Pantheon: String?
    let PhysicalPower: Float?
    let PhysicalPowerPerLevel: Float?
    let PhysicalProtection: Float?
    let PhysicalProtectionPerLevel: Float?
    let Pros: String?
    let Roles: String?
    let Speed: Float?
    let Title: String?
    let `Type`: String?
    let abilityDescription1: AbilityDescription?
    let abilityDescription2: AbilityDescription?
    let abilityDescription3: AbilityDescription?
    let abilityDescription4: AbilityDescription?
    let abilityDescription5: AbilityDescription?
    let basicAttack: AbilityDescription?
    let godAbility1_URL: String?
    let godAbility2_URL: String?
    let godAbility3_URL: String?
    let godAbility4_URL: String?
    let godAbility5_URL: String?
    let godCard_URL: String?
    let godIcon_URL: String?
    let id: Int?
    let latestGod: String?
    
    func toString() -> String {
        var objectString = "Session Response { \n //generic \n"
        
        if self.ret_msg != nil {
            objectString += "\tret_msg: \(self.ret_msg!),\n"
        }
        objectString += "//createsession \n"
        if self.session_id != nil {
            objectString += "\tsession_id: \(self.session_id!),\n"
        }
        if self.timestamp != nil {
            objectString += "\ttimestamp: \(self.timestamp!),\n"
        }
        objectString += "//getgods \n"
        if self.Ability1 != nil {
            objectString += "\tAbility1: \(self.Ability1!),\n"
        }
        if self.Ability2 != nil {
            objectString += "\tAbility2: \(self.Ability2!),\n"
        }
        if self.Ability3 != nil {
            objectString += "\tAbility3: \(self.Ability3!),\n"
        }
        if self.Ability4 != nil {
            objectString += "\tAbility4: \(self.Ability4!),\n"
        }
        if self.Ability5 != nil {
            objectString += "\tAbility5: \(self.Ability5!),\n"
        }
        if self.AbilityId1 != nil {
            objectString += "\tAbilityId1: \(self.AbilityId1!),\n"
        }
        if self.AbilityId2 != nil {
            objectString += "\tAbilityId2: \(self.AbilityId2!),\n"
        }
        if self.AbilityId3 != nil {
            objectString += "\tAbilityId3: \(self.AbilityId3!),\n"
        }
        if self.AbilityId4 != nil {
            objectString += "\tAbilityId4: \(self.AbilityId4!),\n"
        }
        if self.AbilityId5 != nil {
            objectString += "\tAbilityId5: \(self.AbilityId5!),\n"
        }
        if self.Ability_1 != nil {
            objectString += "\tAbility_1: \(self.Ability_1!.toString()),\n"
        }
        if self.Ability_2 != nil {
            objectString += "\tAbility_2: \(self.Ability_2!.toString()),\n"
        }
        if self.Ability_3 != nil {
            objectString += "\tAbility_3: \(self.Ability_3!.toString()),\n"
        }
        if self.Ability_4 != nil {
            objectString += "\tAbility_4: \(self.Ability_4!.toString()),\n"
        }
        if self.Ability_5 != nil {
            objectString += "\tAbility_5: \(self.Ability_5!.toString()),\n"
        }
        if self.AttackSpeed != nil {
            objectString += "\tAttackSpeed: \(self.AttackSpeed!),\n"
        }
        if self.AttackSpeedPerLevel != nil {
            objectString += "\tAttackSpeedPerLevel: \(self.AttackSpeedPerLevel!),\n"
        }
        if self.AutoBanned != nil {
            objectString += "\tAutoBanned: \(self.AutoBanned!),\n"
        }
        if self.Cons != nil {
            objectString += "\tCons: \(self.Cons!),\n"
        }
        if self.HP5PerLevel != nil {
            objectString += "\tHP5PerLevel: \(self.HP5PerLevel!),\n"
        }
        if self.Health != nil {
            objectString += "\tHealth: \(self.Health!),\n"
        }
        if self.HealthPerFive != nil {
            objectString += "\tHealthPerFive: \(self.HealthPerFive!),\n"
        }
        if self.HealthPerLevel != nil {
            objectString += "\tHealthPerLevel: \(self.HealthPerLevel!),\n"
        }
        if self.Lore != nil {
            objectString += "\tLore: \(self.Lore!),\n"
        }
        if self.MP5PerLevel != nil {
            objectString += "\tMP5PerLevel: \(self.MP5PerLevel!),\n"
        }
        if self.MagicProtection != nil {
            objectString += "\tMagicProtection: \(self.MagicProtection!),\n"
        }
        if self.MagicProtectionPerLevel != nil {
            objectString += "\tMagicProtectionPerLevel: \(self.MagicProtectionPerLevel!),\n"
        }
        if self.MagicalPower != nil {
            objectString += "\tMagicalPower: \(self.MagicalPower!),\n"
        }
        if self.MagicalPowerPerLevel != nil {
            objectString += "\tMagicalPowerPerLevel: \(self.MagicalPowerPerLevel!),\n"
        }
        if self.Mana != nil {
            objectString += "\tMana: \(self.Mana!),\n"
        }
        if self.ManaPerFive != nil {
            objectString += "\tManaPerFive: \(self.ManaPerFive!),\n"
        }
        if self.ManaPerLevel != nil {
            objectString += "\tManaPerLevel: \(self.ManaPerLevel!),\n"
        }
        if self.Name != nil {
            objectString += "\tName: \(self.Name!),\n"
        }
        if self.OnFreeRotation != nil {
            objectString += "\tOnFreeRotation: \(self.OnFreeRotation!),\n"
        }
        if self.Pantheon != nil {
            objectString += "\tPantheon: \(self.Pantheon!),\n"
        }
        if self.PhysicalPower != nil {
            objectString += "\tPhysicalPower: \(self.PhysicalPower!),\n"
        }
        if self.PhysicalPowerPerLevel != nil {
            objectString += "\tPhysicalPowerPerLevel: \(self.PhysicalPowerPerLevel!),\n"
        }
        if self.PhysicalProtection != nil {
            objectString += "\tPhysicalProtection: \(self.PhysicalProtection!),\n"
        }
        if self.PhysicalProtectionPerLevel != nil {
            objectString += "\tPhysicalProtectionPerLevel: \(self.PhysicalProtectionPerLevel!),\n"
        }
        if self.Pros != nil {
            objectString += "\tPros: \(self.Pros!),\n"
        }
        if self.Roles != nil {
            objectString += "\tRoles: \(self.Roles!),\n"
        }
        if self.Speed != nil {
            objectString += "\tSpeed: \(self.Speed!),\n"
        }
        if self.Title != nil {
            objectString += "\tTitle: \(self.Title!),\n"
        }
        if self.abilityDescription1 != nil {
            objectString += "\tabilityDescription1: \(self.abilityDescription1!.toString()),\n"
        }
        if self.abilityDescription2 != nil {
            objectString += "\tabilityDescription2: \(self.abilityDescription2!.toString()),\n"
        }
        if self.abilityDescription3 != nil {
            objectString += "\tabilityDescription3: \(self.abilityDescription3!.toString()),\n"
        }
        if self.abilityDescription4 != nil {
            objectString += "\tabilityDescription4: \(self.abilityDescription4!.toString()),\n"
        }
        if self.abilityDescription5 != nil {
            objectString += "\tabilityDescription5: \(self.abilityDescription5!.toString()),\n"
        }
        if self.basicAttack != nil {
            objectString += "\tbasicAttack: \(self.basicAttack!.toString()),\n"
        }
        if self.godAbility1_URL != nil {
            objectString += "\tgodAbility1_URL: \(self.godAbility1_URL!),\n"
        }
        if self.godAbility2_URL != nil {
            objectString += "\tgodAbility2_URL: \(self.godAbility2_URL!),\n"
        }
        if self.godAbility3_URL != nil {
            objectString += "\tgodAbility3_URL: \(self.godAbility3_URL!),\n"
        }
        if self.godAbility4_URL != nil {
            objectString += "\tgodAbility4_URL: \(self.godAbility4_URL!),\n"
        }
        if self.godAbility5_URL != nil {
            objectString += "\tgodAbility5_URL: \(self.godAbility5_URL!),\n"
        }
        if self.godCard_URL != nil {
            objectString += "\tgodCard_URL: \(self.godCard_URL!),\n"
        }
        if self.godIcon_URL != nil {
            objectString += "\tgodIcon_URL: \(self.godIcon_URL!),\n"
        }
        if self.id != nil {
            objectString += "\tid: \(self.id!),\n"
        }
        if self.latestGod != nil {
            objectString += "\tlatestGod: \(self.latestGod!),\n"
        }
        objectString += "}"
        
        return objectString
    }
}
//
//struct Gods : Codable {
//    let 
//}

struct MenuItem : Codable {
    let description: String
    let value: String
    
    func toString() -> String {
        let objectString =
        """
        {
            description: \(self.description),
            value: \(self.value)
        }
        """
        return objectString
    }
}

struct ItemDescription : Codable {
    let cooldown: String
    let cost: String
    let description: String
    let menuitems: Array<MenuItem>
    let rankitems: Array<MenuItem>
    
    func toString() -> String {
        var menuitemsString = "["
        for item in menuitems {
            menuitemsString += item.toString() + ", "
        }
        menuitemsString += "]"
        
        var rankitemsString = "["
        for item in rankitems {
            rankitemsString += item.toString() + ", "
        }
        rankitemsString += "]"
        
        let objectString =
        """
        {
            cooldown: \(self.cooldown),
            cost: \(self.cost),
            description: \(self.description),
            menuitems: \(menuitemsString),
            rankitems: \(rankitemsString)
        }
        """
        return objectString
    }
}

struct AbilityDescription : Codable {
    var itemDescription: ItemDescription
    
    func toString() -> String {
        let objectString =
        """
        {
            itemDescription: \(self.itemDescription)
        }
        """
        
        return objectString
    }
}

struct GodAbility : Codable {
    let Description: AbilityDescription
    let Id: Int
    let Summary: String
    let URL: String
    
    func toString() -> String {
        let objectString =
        """
        {
            Description: \(self.Description),
            Id: \(self.Id),
            Summary: \(self.Summary),
            URL: \(self.URL)
        }
        """
        return objectString
    }
}
