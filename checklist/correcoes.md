# ✅ Correções aplicadas após análise dos scanners

---

## 🔍 Alerta do rkhunter: /usr/bin/lwp-request

- **Alerta:** Arquivo potencialmente suspeito: /usr/bin/lwp-request
- **Análise:** Arquivo é um script do pacote legítimo `libwww-perl`
- **Verificação feita:**
```bash
file /usr/bin/lwp-request
dpkg -S /usr/bin/lwp-request
```
- **Decisão:** Falso positivo – mantido no sistema

---

## ⚠️ Alerta: Large Shared Memory Segments

- **Scanner:** rkhunter
- **Descrição:** Segmentos grandes de memória compartilhada encontrados.
- **Verificação realizada:**
```bash
ipcs -m
ipcs -m -p
```
- **Análise:** Segmentos criados por processos legítimos (Xorg/GDM).
- **Correção preventiva:** Adicionado hardening no `/etc/fstab`:
```fstab
tmpfs /dev/shm tmpfs defaults,noexec,nosuid,nodev 0 0
```
```bash
sudo mount -o remount /dev/shm
```---

## ⚠️ SMTP Banner expõe software ou sistema operacional

- **Scanner:** Lynis – [MAIL-8818](https://cisofy.com/lynis/controls/MAIL-8818/)
- **Correção aplicada:**
```bash
sudo nano /etc/postfix/main.cf
# smtpd_banner = $myhostname ESMTP
sudo systemctl restart postfix
```

---

## ⚠️ iptables carregado, mas sem regras

- **Scanner:** Lynis – [FIRE-4512](https://cisofy.com/lynis/controls/FIRE-4512/)
- **Correção aplicada:**
```bash
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
```

---

## 🔒 Correções de parâmetros sysctl (Kernel Hardening)

- **Scanner:** Lynis – sysctl checks
- **Correções aplicadas:**
```bash
sudo sysctl -w dev.tty.ldisc_autoload=0
sudo sysctl -w fs.protected_fifos=2
sudo sysctl -w kernel.core_uses_pid=1
sudo sysctl -w kernel.perf_event_paranoid=3
sudo sysctl -w kernel.unprivileged_bpf_disabled=1
sudo sysctl -w net.core.bpf_jit_harden=2
sudo sysctl -w net.ipv4.conf.default.accept_source_route=0
sudo sysctl -w net.ipv4.conf.default.log_martians=1
```
- **Persistente via:** `/etc/sysctl.d/99-hardening.conf`---

## ⚠️ SMTP Banner expõe software ou sistema operacional

- **Scanner:** Lynis – [MAIL-8818](https://cisofy.com/lynis/controls/MAIL-8818/)
- **Correção aplicada:**
```bash
sudo nano /etc/postfix/main.cf
# smtpd_banner = $myhostname ESMTP
sudo systemctl restart postfix
```

---

## ⚠️ iptables carregado, mas sem regras

- **Scanner:** Lynis – [FIRE-4512](https://cisofy.com/lynis/controls/FIRE-4512/)
- **Correção aplicada:**
```bash
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
```

---

## 🔒 Correções de parâmetros sysctl (Kernel Hardening)

- **Scanner:** Lynis – sysctl checks
- **Correções aplicadas:**
```bash
sudo sysctl -w dev.tty.ldisc_autoload=0
sudo sysctl -w fs.protected_fifos=2
sudo sysctl -w kernel.core_uses_pid=1
sudo sysctl -w kernel.perf_event_paranoid=3
sudo sysctl -w kernel.unprivileged_bpf_disabled=1
sudo sysctl -w net.core.bpf_jit_harden=2
sudo sysctl -w net.ipv4.conf.default.accept_source_route=0
sudo sysctl -w net.ipv4.conf.default.log_martians=1
```
- **Persistente via:** `/etc/sysctl.d/99-hardening.conf`

- **Persistência configurada:** /etc/sysctl.d/99-hardening.conf

---

## ⚠️ Permissões inseguras no CUPS

- **Scanner:** Lynis – Seção "Printers and Spools"
- **Correção aplicada:**
```bash
sudo chmod 640 /etc/cups/cupsd.conf
sudo chown root:lp /etc/cups/cupsd.conf
```

---

## ⚠️ Banner do Postfix com informações sensíveis

- **Scanner:** Lynis – Seção "Software: e-mail and messaging"
- **Correção aplicada:**
```bash
sudo nano /etc/postfix/main.cf
# smtpd_banner = $myhostname ESMTP
sudo systemctl restart postfix
```

---

## ⚠️ Iptables carregado sem regras ativas

- **Scanner:** Lynis – Seção "Software: firewalls"
- **Correção aplicada:**
```bash
sudo apt install ufw
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
```