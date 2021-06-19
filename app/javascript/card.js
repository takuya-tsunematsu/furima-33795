const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // 環境変数を読み込む
  const form = document.getElementById("charge-form"); 
  form.addEventListener("submit", (e) => { // イベント発火
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = { 
      number: formData.get("purchase_address[number]"),              // カード番号
      cvc: formData.get("purchase_address[cvc]"),                    // カード裏面の3桁の数字
      exp_month: formData.get("purchase_address[exp_month]"),        // 有効期限の月
      exp_year: `20${formData.get("purchase_address[exp_year]")}`,   // 有効期限の年
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");   //idを元に要素を取得
        const tokenObj = `<input value=${token} name='card_token' type="hidden">`;   //paramsの中にトークンを含める
        renderDom.insertAdjacentHTML("beforeend", tokenObj);  //フォームの一番最後に要素を追加
      }
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");
      
        document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);gyazo