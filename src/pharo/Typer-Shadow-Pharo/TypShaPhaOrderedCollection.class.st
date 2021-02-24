Class {
	#name : #TypShaPhaOrderedCollection,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOrderedCollection class >> shadowedClass [
	^ OrderedCollection class
]

{ #category : #shadow }
TypShaPhaOrderedCollection >> mAddFirst: aLookup [ 
	<typShaMethod: 'addFirst:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | '@A' typAsVariableType resolveIn: a receiver ];
		resultType: [ :a :s :r | a argumentTypes at: 1 ];
		yourself
]

{ #category : #shadow }
TypShaPhaOrderedCollection >> mAtPut: aLookup [
	<typShaMethod: 'at:put:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
		arguments:
			{Integer typAsType.
			(aLookup receiver at: '@A')}
]

{ #category : #shadow }
TypShaPhaOrderedCollection >> mRemoveLast: aLookup [
	<typShaMethod: 'removeLast'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #converting }
TypShaPhaOrderedCollection >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters: {('@A' -> '@A' typAsVariableType)} asOrderedDictionary
]
