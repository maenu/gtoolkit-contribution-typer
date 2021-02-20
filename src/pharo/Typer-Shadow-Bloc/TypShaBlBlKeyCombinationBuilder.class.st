Class {
	#name : #TypShaBlBlKeyCombinationBuilder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlKeyCombinationBuilder class >> shadowedClass [
	^ BlKeyCombinationBuilder class
]

{ #category : #accessing }
TypShaBlBlKeyCombinationBuilder >> ___build [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlKeyCombination typAsType ];
		yourself
]

{ #category : #accessing }
TypShaBlBlKeyCombinationBuilder >> ___key: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Key typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
