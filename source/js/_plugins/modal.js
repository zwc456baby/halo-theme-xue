var coffeeModal = {
    toggleCoffeeModal: function () {
        $('#buyCoffee').on('click', function () {
            let coffeeModal = $('#coffeeModal');
            coffeeModal.addClass('is-open');
            coffeeModal.attr('aria-hidden', 'false');
        });

        $('#closeCoffeeModalBtn').on('click', function () {
            let coffeeModal = $('#coffeeModal');
            coffeeModal.attr('aria-hidden', 'true');
            setTimeout(function () {
                coffeeModal.removeClass('is-open');
            }, 100);

        });
    },
    initShowCode: function () {
        var firstCode = $('#coffeeModalContent').children(":first");
        if (firstCode) {
            firstCode.addClass('qr-code-visible');
            var codeData = firstCode.attr('code-data');
            $('#coffeeModalTitle').text(codeData);
        }
    },
    switchQrCode: function () {
        // 点击支付宝按钮
        $('#zfbBtn').on('click', function () {
            var $qrCodeZfb = $('#qrCodeZfb');
            $qrCodeZfb.addClass('qr-code-visible');
            $('#qrCodeWx').removeClass('qr-code-visible');
            $('#coffeeModalTitle').text('支付宝');
        });

        // 点击微信按钮
        $('#wxBtn').on('click', function () {
            var $qrCodeWx = $('#qrCodeWx');
            $qrCodeWx.addClass('qr-code-visible');
            $('#qrCodeZfb').removeClass('qr-code-visible');
            $('#coffeeModalTitle').text('微信支付');
        });

    }
};

$(function () {
    //  模态框
    coffeeModal.toggleCoffeeModal();

    // 初始展示二维码
    coffeeModal.initShowCode();

    // 切换支付二维码
    coffeeModal.switchQrCode();
});