$(function() {
  var form = $(".form");                                         // .formの要素を取得
  Payjp.setPublicKey("pk_test_9df68fcf6f09a4bd0c43289a");        // テストキーをセット
  
  $("#charge-form").on("click", function(e) {
    e.preventDefault();                                          // railsの処理を止めてjsの処理を行う (PAYJPとの通信)
    var card = {                                                 // 入力されたカード情報を取得 (PAYJPに登録するため)
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val()
    };

    Payjp.createToken(card, function(status, response) {         // 上のカード情報がトークンという暗号化したものとして返ってくる
      form.find("input[type=submit]").prop("disabled", true);
      if (status === 200) {                                      // エラーなく進めた場合は"200"になるため
        $("#card_number").removeAttr("name");                    // removeAttr("name")でデータを保持しないよう削除
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        var token = response.id;                                 // "response.id"がトークン！！
        form.append($(`<input type="hidden" name="payjp-token" />`).val(token));           // フォームにトークンを付与
        form.get(0).submit();                                    // 送信！！ railsへ送られる。上でトークンをセットしているのでparamsの中には{"payjp-token" = "トークン"}という情報が入っている
        alert("登録が完了しました");                                //確認用
      } else {
        alert("カード情報が正しくありません。");
        form.prop('disabled', false);
      };
    });
  });
});
