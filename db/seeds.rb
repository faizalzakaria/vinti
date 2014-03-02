
admin = User.create!(name:"Vinti Admin",
             email: "vintichallenge@gmail.com",
             password: "vintiadmin!1")
admin.add_role("admin")

