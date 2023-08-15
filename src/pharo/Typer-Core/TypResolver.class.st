Class {
	#name : #TypResolver,
	#superclass : #TypNode,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypResolver class >> invalidateAll [

	<script>
	self allSubInstancesDo: #invalidate
]

{ #category : #resolving }
TypResolver >> canResolve: aLookup [

	<typPraArguments: 'TypLookup'>
	<typPraResult: 'Boolean'>
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
TypResolver >> invalidate: aLookup onClassChange: aClassAnnouncement [

	^ false
]

{ #category : #'as yet unclassified' }
TypResolver >> invalidate: aLookup onMethodChange: aMethodAnnouncement [

	^ false
]

{ #category : #accessing }
TypResolver >> preResolve: aLookup [
	(self canResolve: aLookup)
		ifTrue: [ ^ aLookup copy
				initializeResolver: self;
				yourself ].
	^ nil
]

{ #category : #resolving }
TypResolver >> resolve: aLookup [
	self subclassResponsibility
]
