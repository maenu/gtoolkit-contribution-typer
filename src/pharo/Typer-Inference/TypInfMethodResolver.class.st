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
	^ aLookup receiver classDescription includesSelector: aLookup selector
]

{ #category : #accessing }
TypInfMethodResolver >> contextAt: aMethodNode self: aType super: anotherType [
	| key |
	key := TypInfContextKey
			node: aMethodNode
			self: aType
			super: anotherType.
	^ self
		outAt: key
		ifAbsent: [ | context |
			context := TypInfContext
					sender: nil
					state: TypInfState new
					node: aMethodNode
					self: aType
					super: anotherType.
			self outAt: key put: context.
			TypInfNodeStack
				push: aMethodNode
				during: [ [ context run ] ifCurtailed: [ self outRemoveAt: key ] ]
				or: [ self outRemoveAt: key.
					context ] ]
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
	(out flatCollect: #yourself)
		select: [ :e | e key isKindOf: TypInfContextKey ]
		thenDo: [ :e | 
			((e key invalidateOnClassChange: aClassAnnouncement) or:
				 (e target invalidateOnClassChange: aClassAnnouncement)) ifTrue: [ 
				self outRemove: e.
				changed := true ] ].
	^ changed
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	| changed |
	changed := false.
	(out flatCollect: #yourself)
		select: [ :e | e key isKindOf: TypInfContextKey ]
		thenDo: [ :e | 
			((e key invalidateOnMethodChange: aMethodAnnouncement) or:
				 (e target invalidateOnMethodChange: aMethodAnnouncement)) 
				ifTrue: [ 
					self outRemove: e.
					changed := true ] ].
	^ changed
]

{ #category : #accessing }
TypInfMethodResolver >> nodeAt: aNode self: aType super: anotherType [
	^ (self
		nodesAt: aNode
		self: aType
		super: anotherType) first
]

{ #category : #accessing }
TypInfMethodResolver >> nodesAt: aNode self: aType super: anotherType [
	^ (self
		contextAt: aNode methodNode
		self: aType
		super: anotherType) nodesAt: aNode
]

{ #category : #printing }
TypInfMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'inf method'
]

{ #category : #accessing }
TypInfMethodResolver >> result: aLookup [
	^ self
		typeAt: (aLookup receiver classDescription lookupSelector: aLookup selector)
				ast
		self: aLookup self
		super: aLookup super
]

{ #category : #accessing }
TypInfMethodResolver >> typeAt: aNode self: aType super: anotherType [
	^ (self
		nodesAt: aNode
		self: aType
		super: anotherType)
		ifEmpty: [ TypUnknownType instance ]
		ifNotEmpty: [ :c | c anyOne type ]
]
