# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
data = [
  {
    sector_id: 1,
    name: "Manufacturing",
    subsectors: [
      { sector_id: 19, name: "Construction materials" },
      { sector_id: 18, name: "Electronics and Optics" },
      {
        sector_id: 6,
        name: "Food and Beverage",
        subsectors: [
          { sector_id: 342, name: "Bakery & confectionary products" },
          { sector_id: 43, name: "Beverages" },
          { sector_id: 42, name: "Fish & fish products" },
          { sector_id: 40, name: "Meat & meat products" },
          { sector_id: 39, name: "Milk & dairy products" },
          { sector_id: 437, name: "Other" },
          { sector_id: 378, name: "Sweets & snack food" },
        ],
      },
      {
        sector_id: 13,
        name: "Furniture",
        subsectors: [
          { sector_id: 389, name: "Bathroom & sauna" },
          { sector_id: 385, name: "Bedroom" },
          { sector_id: 390, name: "Children’s room" },
          { sector_id: 98, name: "Kitchen" },
          { sector_id: 101, name: "Living room" },
          { sector_id: 392, name: "Office" },
          { sector_id: 394, name: "Other (Furniture)" },
          { sector_id: 341, name: "Outdoor" },
          { sector_id: 99, name: "Project furniture" },
        ],
      },
      {
        sector_id: 12,
        name: "Machinery",
        subsectors: [
          { sector_id: 94, name: "Machinery components" },
          { sector_id: 91, name: "Machinery equipment/tools" },
          { sector_id: 224, name: "Manufacture of machinery" },
          {
            sector_id: 97,
            name: "Maritime",
            subsectors: [
              { sector_id: 271, name: "Aluminium and steel workboats" },
              { sector_id: 269, name: "Boat/Yacht building" },
              { sector_id: 230, name: "Ship repair and conversion" },
            ],
          },
          { sector_id: 93, name: "Metal structures" },
          { sector_id: 508, name: "Other" },
          { sector_id: 227, name: "Repair and maintenance service" },
        ],
      },
      {
        sector_id: 11,
        name: "Matalworking",
        subsectors: [
          { sector_id: 67, name: "Construction of metal structures" },
          { sector_id: 263, name: "Houses and buildings" },
          { sector_id: 267, name: "Metal products" },
          {
            sector_id: 542,
            name: "Metal works",
            subsectors: [
              { sector_id: 75, name: "CNC-machining" },
              { sector_id: 62, name: "Forgings, Fasteners" },
              { sector_id: 69, name: "Gas, Plasma, Laser cutting" },
              { sector_id: 66, name: "MIG, TIG, Aluminum welding" },
            ],
          },
        ],
      },
      {
        sector_id: 9,
        name: "Plastic and Rubber",
        subsectors: [
          { sector_id: 54, name: "Packaging" },
          { sector_id: 556, name: "Plastic goods" },
          {
            sector_id: 559,
            name: "Plastic processing technology",
            subsectors: [
              { sector_id: 55, name: "Blowing" },
              { sector_id: 57, name: "Moulding" },
              { sector_id: 53, name: "Plastics welding and processing" },
            ],
          },
          { sector_id: 560, name: "Plastic profiles" },
        ],
      },
      {
        sector_id: 5,
        name: "Printing",
        subsectors: [
          { sector_id: 148, name: "Advertising" },
          { sector_id: 150, name: "Book/Periodicals printing" },
          { sector_id: 145, name: "Labelling and packaging printing" },
        ],
      },
      {
        sector_id: 7,
        name: "Textile and Clothing",
        subsectors: [
          { sector_id: 44, name: "Clothing" },
          { sector_id: 45, name: "Textil" },
        ],
      },
      {
        sector_id: 8,
        name: "Wood",
        subsectors: [
          { sector_id: 337, name: "Other" },
          { sector_id: 51, name: "Wooden building materials" },
          { sector_id: 47, name: "Wooden houses" },
        ],
      },
    ],
  },
  {
    sector_id: 3,
    name: "Other",
    subsectors: [
      { sector_id: 37, name: "Creative industries", subsectors: [] },
      { sector_id: 29, name: "Energy technology", subsectors: [] },
      { sector_id: 33, name: "ENvironment", subsectors: [] },
    ],
  },
  {
    sector_id: 2,
    name: "Service",
    subsectors: [
      { sector_id: 25, name: "Business services", subsectors: [] },
      { sector_id: 35, name: "Engineering", subsectors: [] },
      {
        sector_id: 28,
        name: "Information Technology and Telecommunications",
        subsectors: [
          { sector_id: 581, name: "Data processing, Web portals, E-marketing" },
          { sector_id: 576, name: "Programming, Consultancy" },
          { sector_id: 121, name: "Software, Hardware" },
          { sector_id: 122, name: "Telecommunications" },
        ],
      },
      { sector_id: 22, name: "Tourism" },
      { sector_id: 144, name: "Translation services" },
      {
        sector_id: 21,
        name: "Transport and Logistics",
        subsectors: [
          { sector_id: 111, name: "Air" },
          { sector_id: 114, name: "Rail" },
          { sector_id: 112, name: "Road" },
          { sector_id: 113, name: "Water" },
        ],
      },
    ],
  },
]

def seed_data(data, parent = nil)
    data.each do |item|
      sector = Industry.create!(id: item[:sector_id], name: item[:name])
      seed_data(item[:subsectors], sector) if item[:subsectors].present?
      if parent
        parent.sub_sectors << sector
      end
    end
end

seed_data(data)