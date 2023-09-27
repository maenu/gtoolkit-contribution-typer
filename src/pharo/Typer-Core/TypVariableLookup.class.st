Class {
	#name : #TypVariableLookup,
	#superclass : #TypPropertyLookup,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypVariableLookup class >> receiver: aType selector: aSymbol parent: aLookup [
	^ self index
		at: {aType withoutNode.
				aSymbol asSymbol.
				aLookup}
		ifAbsentPut: [ self new
				initializeReceiver: aType withoutNode selector: aSymbol asSymbol;
				initializeParent: aLookup;
				yourself ]
]

{ #category : #converting }
TypVariableLookup >> asParent [
	child ifNotNil: [ ^ child ].
	self assert: [ self hasParent ].
	^ child := self class
			receiver: receiver super
			selector: selector
			parent: self
]

{ #category : #accessing }
TypVariableLookup >> withReceiver: aType [
	^ self class
		receiver: aType
		selector: selector
		parent: parent
]
