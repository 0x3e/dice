class (exports ? this).Craft
  constructor: ->
    craft = new Probability([
      [1, 'Tailor']
      [1, 'Fletcher/Bowyer']
      [1, 'Glass Blower']
      [1, 'Carpenter']
      [1, 'Animal trainer']
      [1, 'Beast master']
      [1, 'Cartographer']
      [1, 'Smith']
      [1, 'Cobbler']
      [1, 'Weaver']
      [1, 'Armorer']
      [1, 'Weaponsmith']
      [1, 'Brewer']
      [1, 'baker']
      [1, 'Mason']
      [1, 'Potter']
      [1, 'Miller']
      [1, 'Dyer']
      [1, 'Shipwright']
      [1, 'Jeweler']
      [1, 'Artist']
      [1, 'Sculptor']
      [1, 'Musician']
    ])
    craft.add_section 1, 2, craft
    return craft
