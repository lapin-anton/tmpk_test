<%--
  Created by IntelliJ IDEA.
  User: lapin
  Date: 18.01.2021
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Поиск договора</title>
    <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<div class="preloader">
    <svg class="preloader__image" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
        <path fill="currentColor"
              d="M304 48c0 26.51-21.49 48-48 48s-48-21.49-48-48 21.49-48 48-48 48 21.49 48 48zm-48
              368c-26.51 0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48zm208-208c-26.51
              0-48 21.49-48 48s21.49 48 48 48 48-21.49 48-48-21.49-48-48-48zM96 256c0-26.51-21.49-48-48-48S0
              229.49 0 256s21.49 48 48 48 48-21.49 48-48zm12.922 99.078c-26.51 0-48 21.49-48 48s21.49 48 48
              48 48-21.49 48-48c0-26.509-21.491-48-48-48zm294.156 0c-26.51 0-48 21.49-48 48s21.49 48 48 48
              48-21.49 48-48c0-26.509-21.49-48-48-48zM108.922 60.922c-26.51 0-48 21.49-48 48s21.49 48 48 48
              48-21.49 48-48-21.491-48-48-48z">
        </path>
    </svg>
</div>
<div class="container">
    <h2>Поиск договора по номеру</h2>
    <c:url value="/" var="var"/>
    <form action = "${var}" method = "post">
        <label>Номер договора:</label>
        <input type="text" name="contract_id"
               pattern="^[a-z]{2}\/\d{4}-\d{2}$" maxlength="10"
               placeholder="ab/1234-56" required/>
        <input type = "submit" value = "Поиск"/>
    </form>
    <c:if test="${!empty contract_info}">
        <c:forEach var="contract" items="${contract_info}">
            <table>
                <tr class="odd-row">
                    <td>Номер договора</td>
                    <td class="value">${contract.contractId}</td>
                </tr>
                <tr class="even-row">
                    <td>ФИО клинета</td>
                    <td class="value">${contract.fio}</td>
                </tr>
                <tr class="odd-row">
                    <td>Субъект</td>
                    <td class="value">${contract.isCompany}</td>
                </tr>
                <tr class="even-row">
                    <td>Статус договора</td>
                    <td class="value">${contract.status}</td>
                </tr>
                <tr class="odd-row">
                    <td>Адрес клиента</td>
                    <td class="value">Город: ${contract.city},
                        Улица: ${contract.street},
                        Дом: ${contract.building},
                        Квартира: ${contract.apartment}
                    </td>
                </tr>
                <tr class="even-row">
                    <td>Тариф</td>
                    <td class="value">${tariff.tariff}</td>
                </tr>
                <tr class="odd-row">
                    <td>Начало действия</td>
                    <td class="value">${tariff.startDate}</td>
                </tr>
                <tr class="even-row">
                    <td>Окончание действия</td>
                    <td class="value">${tariff.finishDate}</td>
                </tr>
                <tr class="odd-row">
                    <td>Баланс</td>
                    <td class="value">${balance}</td>
                </tr>
            </table>
        </c:forEach>
    </c:if>
</div>
<script>
    window.onload = function () {
        document.body.classList.add('loaded_hiding');
        window.setTimeout(function () {
            document.body.classList.add('loaded');
            document.body.classList.remove('loaded_hiding');
        }, 500);
    }
</script>
</body>
</html>
