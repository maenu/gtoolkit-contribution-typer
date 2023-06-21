Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfMethodResolver class >> instance [

	^ instance ifNil: [ instance := self new ]
]

{ #category : #invalidation }
TypInfMethodResolver class >> invalidate [

	<script>
	instance := nil
]

{ #category : #accessing }
TypInfMethodResolver >> canResolve: aLookup [

	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	^ aLookup receiver classDescription includesSelector:
		  aLookup selector
]

{ #category : #accessing }
TypInfMethodResolver >> contextAt: aMethodNode self: aType super: anotherType [
	^ self
		outgoingAt: (TypInfContextKey
				node: aMethodNode
				self: aType
				super: anotherType)
		ifAbsentPut: [ (TypInfContext
				sender: nil
				state: TypInfState new
				node: aMethodNode
				self: aType
				super: anotherType)
				run;
				yourself ]
]

{ #category : #'as yet unclassified' }
TypInfMethodResolver >> invalidate: aMethodLookup onClassChange: aClassAnnouncement [

	^ aClassAnnouncement typInfInvalidatesMethod: aMethodLookup
]

{ #category : #'as yet unclassified' }
TypInfMethodResolver >> invalidate: aMethodLookup onMethodChange: aMethodAnnouncement [

	^ aMethodAnnouncement typInfInvalidatesMethod: aMethodLookup
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnClassChange: aClassAnnouncement [

	| changed |
	changed := false.
	(outgoing flatCollect: #yourself)
		select: [ :e | e key isKindOf: TypInfContextKey ]
		thenDo: [ :e | 
			((e key invalidateOnClassChange: aClassAnnouncement) or:
				 (e target invalidateOnClassChange: aClassAnnouncement)) ifTrue: [ 
				self outgoingRemove: e.
				changed := true ] ].
	^ changed
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	| changed |
	changed := false.
	(outgoing flatCollect: #yourself)
		select: [ :e | e key isKindOf: TypInfContextKey ]
		thenDo: [ :e | 
			((e key invalidateOnMethodChange: aMethodAnnouncement) or:
				 (e target invalidateOnMethodChange: aMethodAnnouncement)) 
				ifTrue: [ 
					self outgoingRemove: e.
					changed := true ] ].
	^ changed
]

{ #category : #accessing }
TypInfMethodResolver >> nodeAt: aNode self: aType super: anotherType [

	^ (self contextAt: aNode methodNode self: aType super: anotherType) 
		  nodeAt: aNode
]

{ #category : #printing }
TypInfMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'inf method'
]

{ #category : #accessing }
TypInfMethodResolver >> resolve: aLookup [

	| node |
	self assert: [ self canResolve: aLookup ].
	aLookup initializeResolver: self.
	node := (aLookup receiver classDescription >> aLookup selector) ast.
	^ self
		  typeAt: node
		  self: aLookup root receiver
		  super: aLookup receiver superOrNil
]

{ #category : #accessing }
TypInfMethodResolver >> typeAt: aNode self: aType super: anotherType [

	^ TypInfMethodNodeStack
		  push: aNode methodNode
		  max: 8
		  during: [ 
		  (self nodeAt: aNode self: aType super: anotherType) type ]
		  or: [ TypUnknownType instance ]
]
