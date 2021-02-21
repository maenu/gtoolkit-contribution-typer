Class {
	#name : #TypShaBlBlKeyCombinationBuilder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlKeyCombinationBuilder class >> shadowedClass [
	^ BlKeyCombinationBuilder class
]

{ #category : #shadow }
TypShaBlBlKeyCombinationBuilder >> mBuild: aLookup [ 
	<typShaMethod: 'build'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlKeyCombination typAsType ];
		yourself
]

{ #category : #shadow }
TypShaBlBlKeyCombinationBuilder >> mKey: aLookup [ 
	<typShaMethod: 'key:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Key typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
