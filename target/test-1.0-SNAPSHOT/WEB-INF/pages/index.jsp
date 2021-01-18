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
    <title>Поиск контракта</title>
</head>
<body>
<h2>Поиск контракта по номеру</h2>
<c:url value="/" var="var"/>
<form action = "${var}" method = "POST">
    <label>Номер контракта:</label>
    <input type="text" name="contract_id"
           required pattern="^[a-z]{2}\/\d{4}\-\d{2}$" maxlength="10"/>
    <input type = "submit" value = "Поиск"/>
</form>
<c:if test="${!empty contract_info}">
    <c:forEach var="contract" items="${contract_info}">
        <table>
            <tr>
                <td>Номер договора</td>
                <td>${contract.contractId}</td>
            </tr>
            <tr>
                <td>ФИО клинета</td>
                <td>${contract.fio}</td>
            </tr>
            <tr>
                <td>Субъект</td>
                <td>${contract.isCompany}</td>
            </tr>
            <tr>
                <td>Статус договора</td>
                <td>${contract.status}</td>
            </tr>
            <tr>
                <td>Адрес клиента</td>
                <td>Город: ${contract.city},
                    Улица: ${contract.street},
                    Дом: ${contract.building},
                    Квартира: ${contract.apartment}
                </td>
            </tr>
            <tr>
                <td>Тариф</td>
                <td>${tariff.tariff}</td>
            </tr>
            <tr>
                <td>Начало действия</td>
                <td>${tariff.startDate}</td>
            </tr>
            <tr>
                <td>Окончание действия</td>
                <td>${tariff.finishDate}</td>
            </tr>
            <tr>
                <td>Баланс</td>
                <td>${balance}</td>
            </tr>
        </table>
    </c:forEach>
</c:if>
</body>
</html>
