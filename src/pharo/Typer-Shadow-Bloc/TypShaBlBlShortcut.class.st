Class {
	#name : #TypShaBlBlShortcut,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlShortcut class >> shadowedClass [
	^ BlShortcut class
]

{ #category : #accessing }
TypShaBlBlShortcut >> ___action: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {BlElement typAsType}
				argumentsOptional: true
				signalsAlways: false ];
		resultType: [ :a :s :r | BlShortcut typAsType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlShortcut >> ___combination: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlKeyCombination typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
