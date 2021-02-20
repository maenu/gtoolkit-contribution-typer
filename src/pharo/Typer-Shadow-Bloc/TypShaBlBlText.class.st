Class {
	#name : #TypShaBlBlText,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlText class >> shadowedClass [
	^ BlText class
]

{ #category : #accessing }
TypShaBlBlText >> ___attribute: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlTextAttribute typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlText >> ___attributesAt: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {('@A' -> BlTextAttribute typAsType)} asDictionary ];
		yourself
]

{ #category : #accessing }
TypShaBlBlText >> ___clearAttributes: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithArguments: {BlTextAttribute typAsType}
				result: TypUnknownType new
				argumentsOptional: false ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlText >> ___from: _a to: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | BlText typAsType ];
		yourself
]
