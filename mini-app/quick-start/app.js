// app.js
App({
    onLaunch: function (options) {
        console.log('launch options', { options })
        wx.getSystemInfo({
            success: (res) => {
                console.log(res)
            }
        })
    }

})
