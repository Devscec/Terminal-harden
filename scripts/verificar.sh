#!/bin/bash
# Script para rodar os scanners de segurança

echo "[+] Atualizando pacotes e instalando ferramentas..."
sudo apt update
sudo apt install lynis rkhunter -y

echo "[+] Atualizando rkhunter..."
sudo rkhunter --update
sudo rkhunter --propupd

echo "[+] Rodando rkhunter..."
sudo rkhunter --check | tee relatorios/relatorio-rkhunter.txt

echo "[+] Rodando lynis..."
sudo lynis audit system | tee relatorios/relatorio-lynis.txt

echo "[✓] Scans finalizados. Verifique a pasta 'relatorios/'"