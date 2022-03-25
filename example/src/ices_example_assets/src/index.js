import { ices_example } from "../../declarations/ices_example";
import { Principal } from "@dfinity/principal";



document.getElementById("btn_common").onclick = async function(e){
  const button = e.target;
  button.setAttribute("disabled", true);
  const txt_event_key = document.getElementById("txt_event_key").value.toString();
  const txt_sub_key = document.getElementById("txt_sub_key").value.toString();
  const txt_sub_value = document.getElementById("txt_sub_value").value;

  // Interact with foo actor, calling the emitEvent method
  const result = await ices_example.emitEvent(txt_event_key,txt_sub_key,txt_sub_value);
  button.removeAttribute("disabled");
  document.getElementById("sc_commom").innerText = result;
  return false;
}

document.getElementById("btn_tx").onclick = async function(e){
  const button = e.target;
  button.setAttribute("disabled", true);
  let txt_from = document.getElementById("tx_from").value.toString();
  let tx_to = document.getElementById("tx_to").value.toString();
  let tx_amount = document.getElementById("tx_amount").value;
  let from = Principal.fromText(txt_from);
  let to = Principal.fromText(tx_to);
  let amout = Number(tx_amount);
  const result = await ices_example.transfer(from,to,amout);
  button.removeAttribute("disabled");
  document.getElementById("sc_tx").innerText = result;
  return false;
}

