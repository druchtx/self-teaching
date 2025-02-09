package main

import (
	"io"
	"net/http"
	"os"

	"github.com/labstack/echo"
	"github.com/labstack/echo/middleware"
)

func main() {
	e := echo.New()
	e.Use(middleware.Logger())
	// e.Use(middleware.StaticWithConfig(middleware.StaticConfig{
	// 	Root:   "public",
	// 	Browse: true,
	// }))
	// e.Static("/static", "statics")
	// routing
	// e.GET("/", func(c echo.Context) error {
	// 	return c.String(200, "Hello, World!")
	// })

	e.GET("/users/:id", getUser)
	e.POST("/users/:id", saveUser)
	// e.PUT("/users/:id", updateUser)
	// e.DELETE("/users/:id", deleteUser)
	e.GET("/show", show)

	e.POST("/urlencoded", formUrlencoded)
	e.POST("/formdata", formData)

	e.GET("/", func(c echo.Context) error {
		return c.File("public/index.html")
	})
	e.GET("/file", func(c echo.Context) error {
		return c.File("public/hello.md")
	})
	e.GET("/file-inline", func(c echo.Context) error {
		return c.Inline("public/hello.md", "hello.md")
	})
	e.GET("/file-attachment", func(c echo.Context) error {
		return c.Attachment("public/hello.md", "hello.md")
	})
	e.Logger.Fatal(e.Start(":1323"))
}

func getUser(c echo.Context) error {
	id := c.Param("id")
	return c.String(http.StatusOK, "User "+id)
}

func saveUser(c echo.Context) error {
	id := c.Param("id")
	return c.String(http.StatusOK, "Saved user "+id)
}

// /show?team=x-men&member=wolverine
func show(c echo.Context) error {
	team := c.QueryParam("team")
	member := c.QueryParam("member")
	return c.String(http.StatusOK, "team: "+team+", member: "+member)
}

// Form application/x-www-form-urlencoded
// curl -s -d "name=Lucas" -d "email=xu.lu@ymail.ne.jp" "http://localhost:1323/urlencoded"
func formUrlencoded(c echo.Context) error {
	name := c.FormValue("name")
	email := c.FormValue("email")
	return c.String(http.StatusOK, "name: "+name+", email: "+email)

}

// Form multipart/form-data
// curl -F "name=Joe Smith" -F "avatar=@/path/to/your/avatar.png" http://localhost:1323/formData
func formData(c echo.Context) error {
	name := c.FormValue("name")
	avatar, err := c.FormFile("avatar")
	if err != nil {
		return err
	}

	src, err := avatar.Open()
	if err != nil {
		return err
	}
	defer src.Close()

	dts, err := os.Create(avatar.Filename)
	if err != nil {
		return err
	}
	defer dts.Close()

	if _, err = io.Copy(dts, src); err != nil {
		return err
	}

	return c.HTML(http.StatusOK, "<b>Thank you !! + "+name+"</b>")
}
