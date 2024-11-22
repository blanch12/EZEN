const products = [
    { id: 0, brand: 'DIOR', title: '까나쥬 가디건', price: '4,500,000', url: '../resources/images/product/dummy_dior.png' },
    { id: 1, brand: 'BALENCIAGA', title: 'A-라인 크루넥 드레스', price: '2,970,000', url: '../resources/images/product/dummy_balenciaga.png' },
    { id: 2, brand: 'GUCCI', title: 'GG 인타르시아 울 가디건', price: '2,460,000', url: '../resources/images/product/dummy_gucci.png' },
    { id: 3, brand: 'PRADA', title: '카멜 헤어 블루종 재킷', price: '5,550,000', url: '../resources/images/product/dummy_prada.png' },
    { id: 4, brand: 'LOUIS VUITTON', title: 'LV 이니셜 블라종 40mm 리버서블 벨트', price: '1,030,000', url: '../resources/images/product/dummy_lv.png' },
    { id: 5, brand: 'CHANEL', title: '핸들장식 미니 플랩백', price: '8,760,000', url: '../resources/images/product/dummy_chanel.png' },
    { id: 6, brand: 'HERMES', title: 'GETA 백', price: '8,900,000', url: '../resources/images/product/dummy_hermes.png' },
    { id: 7, brand: 'MONCLER', title: 'Verone 리버서블 쇼트 다운 재킷', price: '3,830,000', url: '../resources/images/product/dummy_moncler.png' },

];

function layout(productBox) {
    productBox.forEach(product => {
        let productTemplate = `
        <li>
            <a href="#">
                <div class="product-thumbnail">
                    <img src="${product.url}" alt="${product.title}">
                </div>
                <div class="product-info display-flex">
                    <span class="item-brand">${product.brand}</span>
                    <span class="item-title">${product.title}</span>
                    <span class="item-price">${product.price}</span>
                </div>
            </a>
        </li>
        `;
        $('#productList').append(productTemplate);
    });
}

layout(products);