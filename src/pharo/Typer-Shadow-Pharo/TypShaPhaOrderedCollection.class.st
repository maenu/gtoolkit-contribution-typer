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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1)
		arguments: {(aLookup receiver at: '@A')}
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
