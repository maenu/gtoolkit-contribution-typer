Class {
	#name : #TypShaBrBrButton,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrButton class >> shadowedClass [
	^ BrButton class
]

{ #category : #accessing }
TypShaBrBrButton >> ___action: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {}
				result: TypUnknownType new
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBrBrButton >> ___icon: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlElement typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
