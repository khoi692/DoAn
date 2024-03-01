function showOrderDetail(orderId) {
  $.ajax({
    url: 'orderDetail.jsp',
    type: 'GET',
    data: { orderId: orderId },
    success: function(response) {
      $('#order-detail-container').html(response);
      $('#order-detail-overlay').fadeIn();
      $('#order-detail-container').fadeIn();
    },
    error: function() {
      alert('Đã xảy ra lỗi khi tải trang Order Detail.');
    }
  });
}

function hideOrderDetail() {
  $('#order-detail-overlay').fadeOut();
  $('#order-detail-container').fadeOut();
}
