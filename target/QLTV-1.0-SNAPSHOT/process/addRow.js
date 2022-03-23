/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let btnSubmit = document.querySelector('button');
let table = document.querySelector('table');

let idBook = document.querySelector("idBook");
let title = document.querySelector("title");
let impDate = document.querySelector("impDate");
let quantity = document.querySelector("quantity");
let price = document.querySelector("price");

btnSubmit.addEventListener('click',()=>{
   let idBook = idBook.value;
   let title = title.value;
   let impDate = impDate.value;
   let quantity = quantity.value;
   let price = price.value;
   
   let template = `<tr>
    <td> ${idBook}</td>
    <td> ${title}</td>
    <td> ${impDate}</td>
    <td> ${quantity}</td>
    <td> ${price}</td>
    </tr>`;
    table.innerHTML += template;
});

