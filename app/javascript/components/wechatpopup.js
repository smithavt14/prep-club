function wechatPopUp() {
  if (document.querySelector('.alex-wechat')) {
    const img = 'https://res.cloudinary.com/dbbfpai4q/image/upload/v1534323248/1534323218.png'
    const wechat = document.querySelector('.alex-wechat');
    wechat.addEventListener('click', (event) => {
      swal({
        icon: img
      })
    })
  }
}

export { wechatPopUp }
