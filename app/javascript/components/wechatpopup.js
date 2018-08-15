function wechatPopUp() {
  if (document.querySelector('.alex-wechat')) {
    const img = 'https://qr.api.cli.im/qr?data=https%3A%2F%2Fu.wechat.com%2FMBD4QO9hofAv3BhQ3Yl0K5E&level=H&transparent=false&bgcolor=%23ffffff&forecolor=%23000000&blockpixel=12&marginblock=1&logourl=&size=280&kid=cliim&key=eeba22626e72f42ce8dd5c974ae62d8f'
    const wechat = document.querySelector('.alex-wechat');
    wechat.addEventListener('click', (event) => {
      swal({
        icon: img
      })
    })
  }
}

export { wechatPopUp }
