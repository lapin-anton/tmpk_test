<%--
  Created by IntelliJ IDEA.
  User: lapin
  Date: 18.01.2021
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Поиск договора</title>
    <link href="<c:url value="/res/style.css"/>" rel="stylesheet" type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body>
<c:if test="${! empty message}">
    <script>alert('${message.text}')</script>
</c:if>
<div class="container">

    <h2>Поиск договора по номеру</h2>
    <c:url value="/" var="var"/>
    <form:form method = "post" modelAttribute="contractForm">
        <form:label path="contractId">Номер договора:</form:label>
        <form:input path="contractId" type="text" name="contract_id"
               pattern="^[a-z]{2}\/\d{4}-\d{2}$" maxlength="10"
                    placeholder="ab/1234-56"/>
        <input type="submit" value="Поиск"/>
    </form:form>
    <c:if test="${!empty contract}">
        <table>
            <tr class="odd-row">
                <td>Номер договора</td>
                <td class="value">${contract.mainContractInfo.contractId}</td>
            </tr>
            <tr class="even-row">
                <td>ФИО клинета</td>
                <td class="value">${contract.mainContractInfo.fio}</td>
            </tr>
            <tr class="odd-row">
                <td>Субъект</td>
                <td class="value">${contract.mainContractInfo.isCompany}</td>
            </tr>
            <tr class="even-row">
                <td>Статус договора</td>
                <td class="value">${contract.mainContractInfo.status}</td>
            </tr>
            <tr class="odd-row">
                <td>Адрес клиента</td>
                <td class="value">Город: ${contract.mainContractInfo.city},
                    Улица: ${contract.mainContractInfo.street},
                    Дом: ${contract.mainContractInfo.building},
                    Квартира: ${contract.mainContractInfo.apartment}
                </td>
            </tr>
            <tr class="even-row">
                <td>Тариф</td>
                <td class="value">${contract.taxInfo.tariff}</td>
            </tr>
            <tr class="odd-row">
                <td>Начало действия</td>
                <td class="value">${contract.taxInfo.startDate}</td>
            </tr>
            <tr class="even-row">
                <td>Окончание действия</td>
                <td class="value">${contract.taxInfo.finishDate}</td>
            </tr>
            <tr class="odd-row">
                <td>Баланс</td>
                <td class="value">${contract.balance}</td>
            </tr>
        </table>
    </c:if>

</div>
</body>
</html>
