Class {
	#name : 'TypResolver',
	#superclass : 'TypNode',
	#category : 'Typer-Core-Lookup'
}

{ #category : 'accessing' }
TypResolver class >> reset [

	self allInstancesDo: #reset
]

{ #category : 'accessing' }
TypResolver class >> resetAll [
	<script>
	self withAllSubclassesDo: #reset
]

{ #category : 'resolving' }
TypResolver >> canResolve: aLookup [

	<typPraArguments: 'TypLookup'>
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : 'invalidation' }
TypResolver >> invalidateOn: aClassOrMethodAnnouncement [

	
]

{ #category : 'accessing' }
TypResolver >> reset [
	self removeAllDependents
]

{ #category : 'resolving' }
TypResolver >> resolve: aLookup [
	self subclassResponsibility
]
