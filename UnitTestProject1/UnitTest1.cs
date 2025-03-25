using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using salon_krasoti;
using salon_krasoti.Pages;
using System.Linq;
using System.Windows;
using Moq;
using System.Windows.Controls;


namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestClass]
        public class AuthTests
        {
            [TestMethod]
            public void AuthTestSuccess()
            {
                var authPage = new AuthPage();
                string validLogin = "vladbez";
                string validPassword = "vladbez1"; 

                bool result = authPage.Auth(validLogin, validPassword);

                Assert.IsTrue(result, "Авторизация должна быть успешной для существующего пользователя");
            }

            [TestMethod]
            public void AuthTest()
            {
                var authPage = new AuthPage();

                // Тест с пустым логином
                bool result1 = authPage.Auth("", "password123");
                Assert.IsFalse(result1, "Тест с пустым логином должен вернуть false");

                // Тест с пустым паролем
                bool result2 = authPage.Auth("user1", "");
                Assert.IsFalse(result2, "Тест с пустым паролем должен вернуть false");

                // Тест с неверными данными
                bool result3 = authPage.Auth("nonexistent", "wrongpassword");
                Assert.IsFalse(result3, "Тест с неверными данными должен вернуть false");
            }

            [TestMethod]
            public void AuthTestNoLogin()
            {
                var authPage = new AuthPage();

                bool result = authPage.Auth("", "oleg44333");

                Assert.IsFalse(result, "Авторизация без логина должна быть невозможна");
            }

            [TestMethod]
            public void AuthTestNoPassword()
            {
                var authPage = new AuthPage();

                bool result = authPage.Auth("serg", "");

                Assert.IsFalse(result, "Авторизация без пароля должна быть невозможна");
            }

            [TestMethod]
            public void AuthTestUnregisteredUser()
            {
                var authPage = new AuthPage();

                bool result = authPage.Auth("yarik", "yara1234");

                Assert.IsFalse(result, "Авторизация незарегистрированного пользователя должна быть невозможна");
            }

        }
    }
}
