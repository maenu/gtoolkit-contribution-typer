Class {
	#name : #TypInfMethodLookup,
	#superclass : #TypMethodLookup,
	#instVars : [
		'message'
	],
	#category : #'Typer-Inference-Core'
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
	^ self index
		at: {aType.
				aSymbol asSymbol.
				aCollection asArray.
				anotherType.
				yetAnotherType.
				aMessage.
				aLookup}
		ifAbsentPut: [ self new
				initializeReceiver: aType selector: aSymbol asSymbol;
				initializeArguments: aCollection asArray
					self: anotherType
					super: yetAnotherType;
				initializeMessage: aMessage;
				initializeParent: aLookup;
				yourself ]
]

{ #category : #accessing }
TypInfMethodLookup class >> receiver: aType selector: aSymbol arguments: aCollection self: anotherType super: yetAnotherType parent: aLookup [
	self shouldNotImplement
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
TypInfMethodLookup >> initializeMessage: aMessage [
	self assert: [ aMessage isKindOf: TypInfMessage ].
	message := aMessage
]

{ #category : #accessing }
TypInfMethodLookup >> message [
	^ message
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
