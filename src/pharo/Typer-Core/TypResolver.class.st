Class {
	#name : #TypResolver,
	#superclass : #TypNode,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypResolver class >> invalidateAll [

	<script>
	self allInstancesDo: #invalidate
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
TypResolver >> invalidateOnClassChange: aClassAnnouncement [

	
]

{ #category : #invalidation }
TypResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	
]

{ #category : #resolving }
TypResolver >> resolve: aLookup [
	self subclassResponsibility
]