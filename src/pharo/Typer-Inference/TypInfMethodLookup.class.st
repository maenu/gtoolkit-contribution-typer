Class {
	#name : #TypInfMethodLookup,
	#superclass : #TypMethodLookup,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection message: aMessage parent: aLookup [
	^ self
		receiver: aType
		selector: aSymbol asSymbol
		arguments: aCollection
		self: aType
		super: aType superOrNil
		message: aMessage
		parent: aLookup
]

{ #category : #accessing }
TypInfMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection parent: aLookup [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection self: anotherType super: yetAnotherType message: aMessage parent: aLookup [
	"no indexed as not referenced my anyone other than the context, which is also not indexed"

	^ self new
		initializeReceiver: aType selector: aSymbol asSymbol;
		initializeArguments: aCollection asArray
			self: anotherType
			super: yetAnotherType;
		initializeMessage: aMessage;
		initializeParent: aLookup;
		yourself
]

{ #category : #accessing }
TypInfMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection self: anotherType super: yetAnotherType parent: aLookup [
	self shouldNotImplement
]

{ #category : #accessing }
TypInfMethodLookup >> asDefault [
	^ TypMethodLookup
		receiver: receiver
		selector: selector
		arguments: arguments
		self: selfType
		super: superType
		parent: (parent ifNotNil: #asDefault)
]

{ #category : #accessing }
TypInfMethodLookup >> asParent [
	child ifNotNil: [ ^ child ].
	self assert: [ self hasParent ].
	^ child := self class
			receiver: receiver super
			selector: selector
			arguments: arguments
			self: selfType
			super: receiver super superOrNil
			message: message
			parent: self
]

{ #category : #accessing }
TypInfMethodLookup >> hasParent [
	^ receiver hasSuper
]

{ #category : #accessing }
TypInfMethodLookup >> initializeArguments: aCollection self: aType super: anotherType [
	"self assert: [ aCollection noneSatisfy: #hasNode ].
	self assert: [ aType hasNode not ].
	anotherType ifNotNil: [ self assert: [ anotherType hasNode not ] ]. we want nodes in this case, as we are not caching"
	arguments := aCollection.
	selfType := aType.
	superType := anotherType
]

{ #category : #accessing }
TypInfMethodLookup >> initializeMessage: aMessage [
	self assert: [ aMessage isKindOf: TypInfMessage ].
	message := aMessage
]

{ #category : #accessing }
TypInfMethodLookup >> initializeReceiver: aType selector: aSymbol [
	self assert: [ aType isKindOf: TypType ].
	"self assert: [ aType hasNode not ]. we want nodes in this case, as we are not caching"
	receiver := aType.
	selector := aSymbol
]

{ #category : #accessing }
TypInfMethodLookup >> message [
	^ message
]

{ #category : #accessing }
TypInfMethodLookup >> methods [
	| method |
	method := receiver classDescription lookupSelector: selector.
	^ method isAbstract
		ifTrue: [ (self root self overriders: method) ifEmpty: [ {method} ] ]
		ifFalse: [ {method} ]
]

{ #category : #accessing }
TypInfMethodLookup >> withReceiver: aType [
	^ self class
		receiver: aType
		selector: selector
		arguments: arguments
		self: aType
		super: aType superOrNil
		message: message
		parent: parent
]
