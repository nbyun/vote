$(function(){

    $.rails.allowAction = function(link){
        var message = link.data('confirm'),
            answer = false, callback;
        if (!message) { return true; }
        $.rails.showConfirmationDialog(link);
        return false;
    };
    $.rails.confirm = function(message) {
        return confirm(message);
    };
    //User click confirm button
    $.rails.confirmed = function(link){
        link.data("confirm", null);
        link.trigger("click.rails");
    };

    //Display the confirmation dialog
    $.rails.showConfirmationDialog = function (link) {
        var message = link.data("confirm");
        var confirmButtonText = link.data("confirm-button-text");
        if(confirmButtonText == null) confirmButtonText = '删除';
        if(link.data("remote")){
            confirmBox(message, function(){
                $.rails.confirmed(link);
                link.data("confirm", '确定投给这个比崽？');
                //loading(false);
            })
        }else{
            swal({
                title: message,
                type: 'warning',
                showCancelButton: true,
                cancelButtonColor: '#d33',
                confirmButtonText: confirmButtonText,
                cancelButtonText: "取消"
            }).then(function () {
                $.rails.confirmed(link);
            }, function(dismiss) {})
        }
    };

});

var successAlert = function (message, callback) {
    swal({ title: '成功', html: message, type: 'success' }).then(function(){ if(callback) callback();})
};
var errorAlert = function (message, callback) {
    swal({ title: '错误', html: message, type: 'error' }).then(function(){ if(callback) callback();})
};
var warningAlert = function (message, callback) {
    swal({ title: '警告', html: message, type: 'warning'}).then(function(){ if(callback) callback();})
};
var confirmBox = function (message, callback) {
    swal({
        title: message,
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        showLoaderOnConfirm: true,
        preConfirm: function () {
            return new Promise(function (resolve, reject) {
                if(callback) callback();
            })
        },
        allowOutsideClick: false
    }).then(function () {}, function(dismiss) {})
};