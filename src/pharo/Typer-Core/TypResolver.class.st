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
		ifTrue: [ ^ aLookup
				resolver: self;
				yourself ].
	^ nil
]

{ #category : #resolving }
TypResolver >> resolve: aLookup [
	self assert: [ self canResolve: aLookup ].
	^ aLookup
		resolver: self;
		result: (self result: aLookup);
		result
]

{ #category : #accessing }
TypResolver >> result: aLookup [
	self subclassResponsibility
]

{ #category : #accessing }
TypResolver >> update: aLookup [
	^ aLookup result
]
