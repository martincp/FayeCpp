/*
 *   Copyright 2014 Kulykov Oleh
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */


#ifndef __FAYECPP_TRANSPORT_H__
#define __FAYECPP_TRANSPORT_H__

#include "../common.h"
#include "../delegate.h"
#include "classmethodwrapper.h"

namespace FayeCpp {
	
	class Transport
	{
	private:
		std::string _url;
		std::string _host;
		std::string _path;
		ClassMethodWrapper<Client, void(Client::*)(Message*), Message> * _processMethod;
		int _port;
		bool _isUseSSL;
		bool _isConnected;
		
		Transport();
		
		Client * client();
		Delegate * delegate();
		
	protected:
		void onConnected();
		void onDisconnected();
		void onTextReceived(const std::string & text);
		void onDataReceived(const std::vector<unsigned char> & data);
		void onError(const std::string & error);
		
	public:
		bool isConnected() const;
		void setUrl(const std::string & url);
		
		const std::string & url() const;
		const std::string & host() const;
		
		/**
		 @brief Should start with '/'
		 */
		const std::string & path() const;
		int port() const;
		bool isUseSSL() const;
		
		virtual const std::string name() const = 0;
		virtual void sendData(const std::vector<unsigned char> & data) = 0;
		virtual void sendText(const std::string & text) = 0;
		virtual void connectToServer() = 0;
		virtual void disconnectFromServer() = 0;
		
		Transport(ClassMethodWrapper<Client, void(Client::*)(Message*), Message> * processMethod);
		
		virtual ~Transport();
	};
	
}

#endif /* __FAYECPP_TRANSPORT_H__ */
