<!--- Document Information -----------------------------------------------------

Title:      AfterNewObserverCollection.cfc

Author:     Mark Mandel
Email:      mark@compoundtheory.com

Website:    http://www.compoundtheory.com

Purpose:    Collection of observers for after new event

Usage:

Modification Log:

Name			Date			Description
================================================================================
Mark Mandel		22/02/2007		Newd

------------------------------------------------------------------------------->
<cfcomponent name="AfterNewObserverCollection" hint="Collection of Observers for after a New" extends="AbstractBaseObserverCollection">

<cfscript>
	instance = StructNew();
</cfscript>

<!------------------------------------------- PUBLIC ------------------------------------------->
<cffunction name="init" hint="Constructor" access="public" returntype="AfterNewObserverCollection" output="false">
	<cfscript>
		super.init();

		return this;
	</cfscript>
</cffunction>

<!------------------------------------------- PACKAGE ------------------------------------------->

<!------------------------------------------- PRIVATE ------------------------------------------->

<cffunction name="fireActionMethod" hint="virtual: fires the action method" access="private" returntype="void" output="false">
	<cfargument name="adapter" hint="the adapter to fire against" type="transfer.com.events.adapter.AbstractBaseEventActionAdapter" required="Yes">
	<cfargument name="event" hint="The event object to fire" type="transfer.com.events.TransferEvent" required="Yes">
	<cfscript>
		if(NOT arguments.adapter.actionAfterNewTransferEvent(arguments.event))
		{
			//if we come across an adapter that is empty, dump it.
			removeObserverByKey(arguments.adapter.getKey());
		}
	</cfscript>
</cffunction>

</cfcomponent>