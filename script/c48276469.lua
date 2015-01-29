--連鎖炸薬
function c48276469.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetHintTiming(0,TIMING_DRAW_PHASE)
	e1:SetOperation(c48276469.regop)
	c:RegisterEffect(e1)
	--damage
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_CONTINUOUS+EFFECT_TYPE_FIELD)
	e2:SetCode(EVENT_CHAIN_SOLVED)
	e2:SetRange(LOCATION_SZONE)
	e2:SetOperation(c48276469.damop)
	c:RegisterEffect(e2)
end
function c48276469.regop(e,tp,eg,ep,ev,re,r,rp)
	e:GetHandler():RegisterFlagEffect(48276469,RESET_CHAIN,0,1)
end
function c48276469.damop(e,tp,eg,ep,ev,re,r,rp)
	local c=re:GetHandler()
	if re:IsHasType(EFFECT_TYPE_ACTIVATE) and re:IsActiveType(TYPE_TRAP) and c~=e:GetHandler() 
	and e:GetHandler():GetFlagEffect(48276469)==0 then
		Duel.Damage(rp,1000,REASON_EFFECT)
	end
end
