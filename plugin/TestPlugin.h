#pragma once
#include <lua/LuaLib.h>

class TestPlugin : public LuaLib
{
public:
	virtual void load_to(sol::table& table) override;

	TestPlugin();
};
