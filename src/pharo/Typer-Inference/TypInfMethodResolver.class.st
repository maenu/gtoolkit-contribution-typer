Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Inference-Core'
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
TypInfMethodResolver >> contextAt: aContextKey [

	^ self outgoingAt: aContextKey ifPresent: #yourself ifAbsent: [ 
		  | context |
		  context := TypInfContext
			             node: aContextKey node
			             self: aContextKey self
			             super: aContextKey super.
		  self outgoingAt: aContextKey put: context.
		  context run.
		  context ]
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnClassChange: aClassAnnouncement [

	self flag: 'FIXME'
	"| class |
	class := aClassAnnouncement classAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		self flag: 'FIXME figure out how invalidation should work'.
		class typAsType >= receiver or: [ 
			(receiver invalidateOnClassChange: aClassAnnouncement) or: [ 
				context invalidateOnClassChange: aClassAnnouncement ] ] ]"
]

{ #category : #invalidation }
TypInfMethodResolver >> invalidateOnMethodChange: aMethodAnnouncement [

	self flag: 'FIXME'
	"| method |
	method := aMethodAnnouncement methodAffected.
	contexts keysAndValuesRemove: [ :association :context | 
		| receiver selector |
		receiver := association key.
		selector := association value.
		(method selector = selector and: [ 
			 method methodClass typAsType >= receiver ]) or: [ 
			(association key invalidateOnMethodChange: aMethodAnnouncement) 
				or: [ context invalidateOnMethodChange: aMethodAnnouncement ] ] ]"
]

{ #category : #accessing }
TypInfMethodResolver >> nodeAt: aNode self: aType super: anotherType [

	| key context |
	key := TypInfContextKey
		       node: aNode methodNode
		       self: aType
		       super: anotherType.
	context := self contextAt: key.
	^ (context nodeAt: aNode) type
]

{ #category : #printing }
TypInfMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'inf method'
]

{ #category : #accessing }
TypInfMethodResolver >> resolve: aLookup [

	| node |
	self assert: [ self canResolve: aLookup ].
	node := (aLookup receiver classDescription >> aLookup selector) ast.
	^ self
		  nodeAt: node
		  self: aLookup root receiver
		  super: aLookup receiver superOrNil
]
