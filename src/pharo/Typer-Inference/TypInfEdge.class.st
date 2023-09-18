Class {
	#name : #TypInfEdge,
	#superclass : #TypEdge,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfEdge >> disable [
	self isDisabled ifTrue: [ ^ self ].
	^ origin
		outRemove: self;
		outAdd: (self copy
				initializeOrigin: origin
					target: target
					key: (key , #Disabled) asSymbol;
				yourself)
]

{ #category : #accessing }
TypInfEdge >> enableOrigin: aNode [
	self assert: [ self isDisabled ].
	^ aNode
		outAdd: (self copy
				initializeOrigin: aNode
					target: target
					key: (key copyFrom: 1 to: key size - #Disabled size) asSymbol;
				yourself)
]

{ #category : #accessing }
TypInfEdge >> isDisabled [
	^ key endsWith: #Disabled
]
