Item.delete_all

mouse = Item.create(
  name: "Mouse",
  description: "Something like a long distance relationship: Avoid at all costs!",
  price: 10000.00,
  image_url: "http://compass.microsoft.com/assets/ff/be/ffbe20a0-c36d-42dd-b710-b1ee6ee0981f.jpg?n=Compact%20Optical%20Mouse%20500.jpg",
  quantity: 0
  )

keyboard_arrows = Item.create(
  name: "Keyboard Arrows",
  description: "cfgdfgdgfdfgdfgdfgdfgdfgdfgdgf",
  price: 999.99,
  image_url: "https://image.freepik.com/free-vector/arrow-keys-vectors_637061.jpg",
  quantity: 0
  )

esc_ggdg = Item.create(
  name: "<Esc>ggdG",
  description: "<Esc> ensures you're in the correct mode. |
      gg moves your cursor to the top of the file. |
      d tells Vim to prepare to delete. |
      G tells Vim to go to the bottom of the file",
  price: 999999.99,
  image_url: "https://userscontent2.emaze.com/images/8344def1-ff81-44b7-83ef-cf328f0d8e78/0dbea3cfa690f0dbf0c9cf3ac62576da.png",
  quantity: 5
  )

cheat_sheet = Item.create(
  name: "Vim Cheat Sheet",
  description: "A life saver",
  price: 90.99,
  image_url: "http://michael.peopleofhonoronly.com/vim/vim_cheat_sheet_for_programmers_print.png",
  quantity: 100
  )

t_shirt = Item.create(
  name: "Vim Shirt",
  description: "All purpose support shirt for your local nerd",
  price: 9.99,
  image_url: "http://ih0.redbubble.net/image.40059463.2726/ra,unisex_tshirt,x1350,fafafa:ca443f4786,front-c,30,60,940,730-bg,f8f8f8.u1.jpg",
  quantity: 100
  )

t_crew_shirt = Item.create(
  name: "Vim Crew Shirt",
  description: "Cold weather support shirt for your local nerd",
  price: 39.99,
  image_url: "http://rlv.zcache.com/vim_t_shirt-r71bf3f39ce8b43658aec516aeb275f0a_jynb8_512.jpg",
  quantity: 100
  )

t_shirt_mistress = Item.create(
  name: "Vim Mistress T-Shirt",
  description: "Nothing but the truth",
  price: 24.99,
  image_url: "http://rlv.zcache.com/vim_is_my_mistress_t_shirt-r8c754926ef704ca39adad0cf76adc9f5_jg4de_512.jpg",
  quantity: 100
  )

t_shirt_excel = Item.create(
  name: "Vim T-Shirt Excel",
  description: "Lowering standards",
  price: 24.99,
  image_url: "http://rlv.zcache.com/vim_emacs_excel_t_shirt-rf339ccaf135d4bd0a52c977b145e945f_jg4de_630.jpg",
  quantity: 100
  )

t_shirt_q = Item.create(
  name: "Vim T-Shirt :q!",
  description: "Just can't get enough! | Quit without writing.",
  price: 24.99,
  image_url: "http://i3.cpcache.com/product/91131991/baseball_jersey.jpg",
  quantity: 100
  )

mug_cheat_sheet = Item.create(
  name: "Vim Mug Cheat Sheet",
  description: "Manual on Caffeine",
  price: 24.99,
  image_url: "http://i3.cpcache.com/product/1282457433/vim_cheat_sheet_mugs.jpg?side=Back&color=White&height=460&width=460&qv=90",
  quantity: 100
  )

mug_hjkl = Item.create(
  name: "Vim Mug h-j-k-l",
  description: "Arrows within reach",
  price: 24.99,
  image_url: "http://i3.cpcache.com/product/535185295/hjkl_vim_navigation_mug.jpg?side=Back&color=White&height=460&width=460&qv=90",
  quantity: 100
  )

wall_paper = Item.create(
  name: "Vim wallpaper",
  description: "Vim Wallpaper | Ultimate decoration",
  price: 4.99,
  image_url: "http://www.unixstickers.com/image/cache/data/poster/vim/xVIM.sh-340x340.png.pagespeed.ic.b0bylRvjXI.png",
  quantity: 50
  )

pin = Item.create(
  name: "Vim Pin",
  description: "Vim Pin",
  price: 4.99,
  image_url: "http://www.unixstickers.com/image/cache/data/buttons/png/vimGreen-180x180.png",
  quantity: 50
  )

Category.delete_all

merchandise = Category.create(
  name: "Merchandise"
  )

prohibited_items = Category.create(
  name: "Prohibited Items"
  )

tools = Category.create(
  name: "Tools"
  )

CategoriesItem.delete_all

CategoriesItem.create(
  item_id: mouse.id,
  category_id: prohibited_items.id
  )

CategoriesItem.create(
  item_id: keyboard_arrows.id,
  category_id: prohibited_items.id
  )

CategoriesItem.create(
  item_id: esc_ggdg.id,
  category_id: prohibited_items.id
  )

CategoriesItem.create(
  item_id: cheat_sheet.id,
  category_id: tools.id
  )

CategoriesItem.create(
  item_id: mug_cheat_sheet.id,
  category_id: tools.id
  )

CategoriesItem.create(
  item_id: mug_cheat_sheet.id,
  category_id: merchandise.id
  )

CategoriesItem.create(
  item_id: t_shirt.id,
  category_id: merchandise.id
  )

CategoriesItem.create(
  item_id: t_crew_shirt.id,
  category_id: merchandise.id
  )

CategoriesItem.create(
  item_id: t_shirt_mistress.id,
  category_id: merchandise.id
  )

CategoriesItem.create(
  item_id: t_shirt_q.id,
  category_id: merchandise.id
  )

CategoriesItem.create(
  item_id: t_shirt_excel.id,
  category_id: merchandise.id
  )

CategoriesItem.create(
  item_id: mug_hjkl.id,
  category_id: merchandise.id
  )

CategoriesItem.create(
  item_id: wall_paper.id,
  category_id: merchandise.id
  )

CategoriesItem.create(
  item_id: pin.id,
  category_id: merchandise.id
  )

User.delete_all
User.create(name: "Tom", email: "tom@tom.com", password: "tomtom")
User.create(name: "Tim", email: "tim@tim.com", password: "timtim", admin: true)
