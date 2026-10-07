# Git ve GitHub Kullanım Rehberi

## İçindekiler
1. [Git Temel Kavramlar](#git-temel-kavramlar)
2. [Git Kurulum ve İlk Ayarlar](#git-kurulum-ve-ilk-ayarlar)
3. [Temel Git Komutları](#temel-git-komutları)
4. [Branching (Dal Oluşturma)](#branching-dal-oluşturma)
5. [GitHub ile Çalışma](#github-ile-çalışma)
6. [Repository Yönetimi](#repository-yönetimi)
7. [Collaboration (İşbirliği)](#collaboration-işbirliği)
8. [İleri Seviye Git Komutları](#ileri-seviye-git-komutları)
9. [Git Best Practices](#git-best-practices)
10. [Troubleshooting](#troubleshooting)

---

## Git Temel Kavramlar

### Git Nedir?
Git, dağıtık versiyon kontrol sistemidir (DVCS - Distributed Version Control System). Kod değişikliklerini takip eder ve birden fazla geliştirici arasında koordinasyonu sağlar.

### Temel Kavramlar
- **Repository (Repo)**: Projenizin tüm dosyalarını ve geçmişini içeren dizin
- **Commit**: Kod değişikliklerinin kaydedilmiş hali
- **Branch**: Paralel geliştirme için oluşturulan dal
- **Merge**: Dalları birleştirme işlemi
- **Clone**: Uzak repositoryu yerel makineye kopyalama
- **Fork**: Başkasının repositoryunu kendi hesabınıza kopyalama
- **Pull Request**: Değişikliklerin gözden geçirilmesi için talep
- **Working Directory**: Üzerinde çalıştığınız dosyalar
- **Staging Area**: Commit için hazırlanmış dosyalar
- **HEAD**: Şu anda bulunduğunuz commit

---

## Git Kurulum ve İlk Ayarlar

### Git Kurulumu
```bash
# Windows
# Git'i https://git-scm.com/download/win adresinden indirin

# macOS
brew install git

# Ubuntu/Debian
sudo apt-get install git

# CentOS/RHEL
sudo yum install git
```

### İlk Ayarlar
```bash
# Kullanıcı bilgilerini ayarlama
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Editör ayarlama
git config --global core.editor "code"  # VS Code için
git config --global core.editor "vim"   # Vim için

# Ayarları kontrol etme
git config --list
git config --global --list
```

### SSH Key Oluşturma (GitHub için)
```bash
# SSH key oluşturma
ssh-keygen -t ed25519 -C "your.email@example.com"

# SSH agent'ı başlatma
eval "$(ssh-agent -s)"

# Private key'i SSH agent'a ekleme
ssh-add ~/.ssh/id_ed25519

# Public key'i kopyalama (GitHub'a eklemek için)
cat ~/.ssh/id_ed25519.pub
```

---

## Temel Git Komutları

### Repository Oluşturma ve Klonlama
```bash
# Yeni repository oluşturma
git init

# Uzak repositoryu klonlama
git clone https://github.com/username/repository.git
git clone git@github.com:username/repository.git  # SSH ile

# Uzak repository URL'ini gösterme
git remote -v

# Uzak repository ekleme
git remote add origin https://github.com/username/repository.git
```

### Dosya Durumu ve Değişiklikler
```bash
# Dosya durumunu kontrol etme
git status

# Değişiklikleri gösterme
git diff
git diff --staged  # Staging area'daki değişiklikler
git diff HEAD      # Son commit ile karşılaştırma

# Dosya geçmişini gösterme
git log
git log --oneline
git log --graph --oneline --all
git log -p filename  # Belirli dosyanın geçmişi
```

### Staging ve Commit
```bash
# Dosyaları staging area'ya ekleme
git add filename
git add .              # Tüm değişiklikleri ekleme
git add *.js          # Belirli uzantıdaki dosyaları ekleme

# Staging area'dan çıkarma
git reset filename
git reset             # Tüm dosyaları çıkarma

# Commit oluşturma
git commit -m "Commit mesajı"
git commit -am "Add ve commit birlikte"  # Tracked dosyalar için

# Son commit'i değiştirme
git commit --amend -m "Yeni commit mesajı"
```

### Dosya İşlemleri
```bash
# Dosya silme
git rm filename
git rm --cached filename  # Sadece git'ten kaldırma

# Dosya taşıma/yeniden adlandırma
git mv oldname newname

# Dosyayı geri alma (unstaged changes)
git checkout -- filename
git restore filename      # Git 2.23+

# Staging area'dan geri alma
git restore --staged filename
```

---

## Branching (Dal Oluşturma)

### Branch İşlemleri
```bash
# Mevcut branch'leri gösterme
git branch
git branch -a    # Uzak branch'ler dahil
git branch -r    # Sadece uzak branch'ler

# Yeni branch oluşturma
git branch branch-name
git checkout -b branch-name    # Oluştur ve geç
git switch -c branch-name      # Git 2.23+

# Branch değiştirme
git checkout branch-name
git switch branch-name         # Git 2.23+

# Branch silme
git branch -d branch-name      # Merged branch'i silme
git branch -D branch-name      # Force silme
git push origin --delete branch-name  # Uzak branch'i silme
```

### Merge İşlemleri
```bash
# Branch merge etme
git checkout main
git merge feature-branch

# Fast-forward merge'i engelleme
git merge --no-ff feature-branch

# Merge conflict'i çözme
# 1. Conflict'li dosyaları düzenle
# 2. git add filename
# 3. git commit

# Merge'i iptal etme
git merge --abort
```

### Rebase
```bash
# Branch'i rebase etme
git checkout feature-branch
git rebase main

# Interactive rebase
git rebase -i HEAD~3    # Son 3 commit'i düzenleme

# Rebase'i iptal etme
git rebase --abort

# Rebase'i devam ettirme
git rebase --continue

```
!!!Note
    git rebase, Git’te dallar (branch) arasındaki değişiklikleri birleştirmek için kullanılan bir komuttur. Özellikle commit geçmişini düzenli ve temiz tutmak amacıyla tercih edilir.

---

## GitHub ile Çalışma

### Repository Oluşturma
1. GitHub'da "New repository" butonuna tıklayın
2. Repository adını ve açıklamasını girin
3. Public/Private seçimini yapın
4. README, .gitignore, lisans dosyalarını seçin

### Remote Operations
```bash
# Değişiklikleri uzak repository'ye gönderme
git push origin main
git push origin branch-name
git push -u origin main    # İlk push ve upstream ayarlama

# Uzak repository'den değişiklikleri alma
git fetch origin
git pull origin main
git pull                   # Current branch için

# Force push (dikkatli kullanın!)
git push --force-with-lease origin main
```

### GitHub CLI
```bash
# GitHub CLI kurulumu
# https://cli.github.com/

# Repository oluşturma
gh repo create repository-name --public
gh repo create repository-name --private

# Repository klonlama
gh repo clone username/repository-name

# Pull request oluşturma
gh pr create --title "PR Title" --body "PR Description"

# Issues görüntüleme
gh issue list
gh issue create --title "Issue Title" --body "Issue Description"
```

---

## Repository Yönetimi

### .gitignore Dosyası
```gitignore
# Node.js
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/
.venv/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Dependencies
bower_components/

# Build outputs
dist/
build/
```

### Git Hooks
```bash
# Pre-commit hook örneği (.git/hooks/pre-commit)
#!/bin/sh
# Linting ve testleri çalıştır
npm run lint
npm run test
```
!!!Note
    Git Hooks, Git’in belirli olaylar (commit, push, merge vb.) gerçekleştiğinde otomatik olarak çalıştırdığı script’lerdir.

### Submodules
```bash
# Submodule ekleme
git submodule add https://github.com/user/repo.git path/to/submodule

# Submodule'ları klonlama
git clone --recurse-submodules https://github.com/user/repo.git

# Submodule güncelleme
git submodule update --remote

# Submodule silme
git submodule deinit path/to/submodule
git rm path/to/submodule
```

---

## Collaboration (İşbirliği)

### Fork Workflow
1. Projeyi fork edin
2. Fork'u klonlayın: `git clone https://github.com/yourusername/project.git`
3. Upstream ekleme: `git remote add upstream https://github.com/originaluser/project.git`
4. Feature branch oluşturun: `git checkout -b feature-name`
5. Değişiklikleri yapın ve commit edin
6. Fork'unuza push edin: `git push origin feature-name`
7. Pull request oluşturun

### Upstream ile Senkronizasyon
```bash
# Upstream'den değişiklikleri alma
git fetch upstream
git checkout main
git merge upstream/main

# veya
git pull upstream main
```

### Pull Request Best Practices
- Açıklayıcı başlık ve açıklama yazın
- Küçük, odaklanmış değişiklikler yapın
- Code review'a açık olun
- CI/CD testlerinin geçtiğinden emin olun
- Conflict'leri çözün

---

## İleri Seviye Git Komutları

### Stash (Geçici Saklama)
```bash
# Değişiklikleri stash'e kaydetme
git stash
git stash save "Stash mesajı"
git stash -u    # Untracked dosyalar dahil

# Stash listesini görme
git stash list

# Stash'i geri yükleme
git stash pop
git stash apply stash@{0}

# Stash silme
git stash drop stash@{0}
git stash clear    # Tüm stash'leri silme
```

### Cherry-pick
```bash
# Belirli commit'i mevcut branch'e alma
git cherry-pick commit-hash
git cherry-pick commit1..commit3  # Commit aralığı
```

### Reset ve Revert
```bash
# Soft reset (staging area korunur)
git reset --soft HEAD~1

# Mixed reset (default, working directory korunur)
git reset HEAD~1

# Hard reset (her şey silinir, dikkatli!)
git reset --hard HEAD~1

# Commit'i geri alma (yeni commit oluşturur)
git revert commit-hash
```

### Reflog
```bash
# Git işlem geçmişini görme
git reflog

# Kayıp commit'i geri alma
git checkout commit-hash
git checkout -b recovered-branch
```

### Bisect (Hata Arama)
```bash
# Binary search ile hata arama
git bisect start
git bisect bad              # Mevcut commit hatalı
git bisect good commit-hash # Bu commit iyi
# Git otomatik olarak commit'ler arasında arama yapar
git bisect reset           # Bisect'i sonlandırma
```

---

## Git Best Practices

### Commit Mesajları
```
# İyi commit mesajı formatı
<type>(<scope>): <subject>

<body>

<footer>

# Örnekler:
feat(auth): add login functionality
fix(api): resolve user authentication issue
docs(readme): update installation instructions
refactor(utils): improve error handling
test(user): add unit tests for user service
```

### Commit Types
- **feat**: Yeni özellik
- **fix**: Hata düzeltme
- **docs**: Dokümantasyon
- **style**: Kod formatı (mantık değişikliği yok)
- **refactor**: Kod yeniden yapılandırma
- **test**: Test ekleme/düzenleme
- **chore**: Build, dependency güncellemeleri

### Branching Strategy
```bash
# Git Flow
main          # Production
develop       # Development
feature/*     # Yeni özellikler
release/*     # Release hazırlığı
hotfix/*      # Acil düzeltmeler

# GitHub Flow
main          # Production
feature/*     # Tüm değişiklikler
```

### Repository Düzeni
- README.md dosyası ekleyin
- .gitignore dosyasını kullanın
- Lisans dosyası ekleyin
- Issue template'leri oluşturun
- CI/CD pipeline kurun (GitHub Actions veya başka bir CI aracı (GitLab CI, Jenkins, Travis) ile kodun otomatik kontrolünü sağlar.)

---

## Troubleshooting

### Yaygın Problemler ve Çözümleri

#### Merge Conflicts
```bash
# Conflict'li dosyayı düzenleme
# <<<<<<< HEAD
# Mevcut branch'teki kod
# =======
# Merge edilen branch'teki kod
# >>>>>>> branch-name

# Conflict çözüldükten sonra
git add filename
git commit
```

#### Yanlış Commit'i Geri Alma
```bash
# Son commit'i geri alma (henüz push edilmemişse)
git reset --soft HEAD~1   # Değişiklikler korunur
git reset --hard HEAD~1   # Değişiklikler silinir

# Push edilen commit'i geri alma
git revert HEAD
git push origin main
```

#### Kayıp Dosyaları Geri Getirme
```bash
# Silinen dosyayı geri getirme
git checkout HEAD -- filename

# Belirli commit'ten dosya geri getirme
git checkout commit-hash -- filename
```

#### Branch'ler Arası Değişiklikleri Taşıma
```bash
# Commit'i başka branch'e taşıma
git checkout target-branch
git cherry-pick commit-hash

# Değişiklikleri stash ile taşıma
git stash
git checkout target-branch
git stash pop
```

#### Remote URL Değiştirme
```bash
# HTTPS'den SSH'e geçiş
git remote set-url origin git@github.com:username/repository.git

# Remote URL'i kontrol etme
git remote -v
```

#### Force Push Güvenli Kullanımı
```bash
# Güvenli force push
git push --force-with-lease origin branch-name

# Normal force push (dikkatli!)
git push --force origin branch-name
```

---

## Faydalı Git Aliases 

```bash
# Git aliases ayarlama
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.lg "log --oneline --graph --all"
git config --global alias.unstage "reset HEAD --"
git config --global alias.last "log -1 HEAD"
git config --global alias.visual "!gitk"
```
!!!Note
    Git aliases, Git komutları için kısayol (alias) tanımlamaktır.

---

## Sonuç

Git ve GitHub, modern yazılım geliştirmenin vazgeçilmez araçlarıdır. Bu rehber ile:

- Temel Git komutlarını öğrendiniz
- GitHub ile nasıl çalışacağınızı öğrendiniz
- İşbirliği süreçlerini anladınız
- İleri seviye teknikleri keşfettiniz
- En iyi uygulamaları öğrendiniz

Unutmayın ki Git öğrenmek pratik gerektirir. Küçük projelerle başlayıp deneyim kazanın, hata yapmaktan korkmayın ve sürekli olarak yeni özellikler öğrenin.

### Faydalı Kaynaklar
- [Git Resmi Dokümantasyonu](https://git-scm.com/doc)
- [GitHub Docs](https://docs.github.com/)
- [Git Pro Book](https://git-scm.com/book)
- [Learn Git Branching](https://learngitbranching.js.org/)
- [GitHub Learning Lab](https://lab.github.com/)
