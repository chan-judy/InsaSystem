$(function () {


    //서치버튼 누른 후에 실행되는 구문

    $("#searchBtn").click(function () {

        console.log("서치js가보자구!!!!");

		

        var s_sabun = $("#s_sabun").val();
        var s_name = $("#s_name").val();
        var s_join_gbn = $("#s_join_gbn").val();
        var s_put_yn = $("#s_put_yn").val();
        var s_pos_gbn = $("#s_pos_gbn").val();
        var s_join_day = $("#s_join_day").val();
        var s_retire_day = $("#s_retire_day").val();
        var s_job_type = $("#s_job_type").val();
        var pageNum = $("#pageNum").val();
        searchOption = $("#searchOption").val();

        var searchStr = "";

        if (s_sabun == "")
            s_sabun = "";

        var params = {
            s_sabun: s_sabun,
            s_name: $("#s_name").val(),
            s_join_gbn: $("#s_join_gbn").val(),
            s_put_yn: $("#s_put_yn").val(),
            s_pos_gbn: $("#s_pos_gbn").val(),
            s_join_day: $("#s_join_day").val(),
            s_retire_day: $("#s_retire_day").val(),
            s_job_type: $("#s_job_type").val(),
            pageNum: $("#pageNum").val(),
            searchOption: true
        }



        if (params.s_sabun == 0 && params.s_name == "" && params.s_join_gbn == "" &&
            params.s_put_yn == "" && params.s_pos_gbn == "" && params.s_join_day == "" &&
            params.s_retire_day == "" && params.s_job_type == "") {
            params = {
                s_sabun: 0,
                s_name: "",
                s_join_gbn: "",
                s_put_yn: "",
                s_pos_gbn: "",
                s_join_day: "",
                s_retire_day: "",
                s_job_type: "",
                pageNum: $("#pageNum").val(),
                searchOption: false
            };
            $("#searchOption").val(false);
        } else {
            if (params.pageNum != "") searchStr += "&pageNum=" + pageNum;
            if (params.s_name != "") searchStr += "&s_name=" + s_name;
            if (params.s_join_gbn != "") searchStr += "&s_join_gbn=" + s_join_gbn;
            if (params.s_put_yn != "") searchStr += "&s_put_yn=" + s_put_yn;
            if (params.s_pos_gbn != "") searchStr += "&s_pos_gbn=" + s_pos_gbn;
            if (params.s_join_day != "") searchStr += "&s_join_day=" + s_join_day;
            if (params.s_retire_day != "") searchStr += "&s_retire_day=" + s_retire_day;
            if (params.s_job_type != "") searchStr += "&s_job_type=" + s_job_type;
            $("#searchOption").val(true);
        }



        $.ajax({
            type: "GET",
            url: "/searchForm.action",
            data: params,
            success: function (data) {
                $("#insaList").empty();
                $(data.insaList).each(function () {

                    var retireDay = dateTextFilter(this.retire_day);
                    var postGbnCode = pgcTextFilter(this.pos_gbn_code);
                    var putYn = putYnTextFilter(this.put_yn);

                    var str =
                        '<tr>' +
                        "<td><input type='checkbox' name='checkbox' value=" + this.sabun + "/></td>" +
                        "<td id='td_sabun'>" +
                        '<a href="/updatedForm.action?sabun=' + this.sabun + '  " > ' +
                        this.sabun + '</a>' +
                        "</td>" +
                        "<td>" +
                        '<a href="/updatedForm.action?sabun=' + this.sabun + '   " > ' +
                        this.name + '</a>' +
                        "</td>" +
                        "<td>" + this.reg_no + "</td>" +
                        "<td>" + this.hp + "</td>" +
                        "<td>" + postGbnCode + "</td>" +
                        "<td>" + this.join_day + "</td>" +
                        "<td>" + retireDay + "</td>" +
                        "<td>" + putYn + "</td>" +
                        "<td>" + this.salary + "</td>" +
                        '</tr>';
                    $("#insaList").append(str);
                });


                function dateTextFilter(str) {
                    if (str == null) {
                        str = "-"
                    } else {
                        str = str.substr(0, 10);
                    }
                    return str;
                }

                function pgcTextFilter(str) {
                    if (str == null || str == '') {
                        str = "-"
                    } else if (str == "03001") {
                        str = "주임";
                    } else if (str == "03002") {
                        str = "대리";
                    } else if (str == "03003") {
                        str = "과장";
                    } else if (str == "03004") {
                        str = "차장";
                    } else if (str == "03005") {
                        str = "부장";
                    } else if (str == 'selected') {
                        str = "-"
                    }
                    return str;
                }

                // putYn 텍스트 필터
                function putYnTextFilter(str) {
                    if (str == null || str == '') {
                        str = "-"
                    } else if (str == "06001") {
                        str = "Y";
                    } else if (str == "06002") {
                        str = "N";
                    } else if (str == 'selected') {
                        str = "-"
                    }
                    return str;
                }

                var naviNum = "";
                var prevBtn = "";
                var nextBtn = "";
                
                for (i = data.startPage; i <= data.endPage; i++) {
                    if (i == data.currentPage) {
                        naviNum += "<span data-pageNum=" + i + " > [ " + i + " ] </span>";
                    } else {
                        naviNum += "<a href='#' data-pageNum=" + i + "> [ " + i + " ] </a>";
                    }
                }

                prevNo = data.startPage - 1;
                nextNo = data.startPage + data.pageGroup;

                if (data.startPage > data.pageGroup) {
                    prevBtn += '<span data-pageNum=' + prevNo + '><&emsp;</span>';
                }

                if (data.endPage < data.pageCount) {
                    nextBtn += '<span data-pageNum=' + nextNo + '> &emsp;> </span>';
                }


                var navi =
                    '<div>' +
                    prevBtn +
                    naviNum +
                    nextBtn +
                    '</div>';
                    
                $("#prenext").empty();   
                $("#prenext").append(navi);

            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("통신 실패.")
            }
        });

        $(document).on("click", "#navi > *", function () {
            var pageNum = $(this).attr("data-pagenum");
            $("#pageNum").val(pageNum);
            $("#searchBtn").click();
        });




        // 삭제버튼
        $("#deleteBtn").click(function () {

            var rowData = new Array();
            var tdArr = new Array();
            var checkbox = $("input[name=checkbox]:checked");

            checkbox.each(function (i) {

                // checkbox.parent() : checkbox의 부모는 <td>이다.        
                // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.        

                var tr = checkbox.parent().parent().eq(i);
                var td = tr.children();

                // 체크된 row의 모든 값을 배열에 담는다.        
                rowData.push(tr.text());

                // td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.       
             
                var sabun = td.eq(1).text() ;
                

                // 가져온 값을 배열에 담는다.       
             
                tdArr.push(sabun);
            });


            console.log(tdArr);


            if (tdArr == "") {
                return false;
            }
            if (!confirm("정말로 삭제 하시겠습니까?")) {
                return false;
            }

            $.ajax({
                url: "/delete.action",
                type: "POST",
                data: {
                    "sabun": tdArr
                },
                traditional: true,
                success: function () {
                    alert("삭제 되었습니다.");

                    $("#searchBtn").click();
                },
                error: function () {
                    alert("땡!")
                }
            })
        })

    })



})
