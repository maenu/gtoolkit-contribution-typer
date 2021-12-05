Class {
	#name : #TypResolver,
	#superclass : #TypNode,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypResolver class >> invalidate [

	self allInstancesDo: #invalidate
]

{ #category : #accessing }
TypResolver class >> invalidateAll [
	<script>
	self withAllSubclassesDo: #invalidate
]

{ #category : #resolving }
TypResolver >> canResolve: aLookup [

	<typPraArguments: 'TypLookup'>
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #accessing }
TypResolver >> invalidate [
	self removeAllDependents
]

{ #category : #invalidation }
TypResolver >> invalidateOnClass: aClassAnnouncement [

	
]

{ #category : #invalidation }
TypResolver >> invalidateOnMethod: aMethodAnnouncement [

	
]

{ #category : #resolving }
TypResolver >> resolve: aLookup [
	self subclassResponsibility
]
