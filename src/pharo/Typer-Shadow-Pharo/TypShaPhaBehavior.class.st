Class {
	#name : #TypShaPhaBehavior,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBehavior class >> shadowedClass [
	^ Behavior class
]

{ #category : #shadow }
TypShaPhaBehavior >> mAllSubclasses: aLookup [
	<typShaMethod: 'allSubclasses'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {Behavior typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mBasicNew: aLookup [
	<typShaMethod: 'basicNew'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			aLookup receiverType classDescription instanceSide typAsType typAsType
]

{ #category : #shadow }
TypShaPhaBehavior >> mBinary83: aLookup [
	<typShaMethod: '>>'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mCanUnderstand: aLookup [
	<typShaMethod: 'canUnderstand:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mClassVarNames: aLookup [
	<typShaMethod: 'classVarNames'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType copyWithParameters: {String typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mCompile: aLookup [
	<typShaMethod: 'compile:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mCompiledMethodAt: aLookup [
	<typShaMethod: 'compiledMethodAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mIncludesBehavior: aLookup [
	<typShaMethod: 'includesBehavior:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Behavior typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mIncludesSelector: aLookup [
	<typShaMethod: 'includesSelector:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mInheritsFrom: aLookup [
	<typShaMethod: 'inheritsFrom:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mInstVarNames: aLookup [
	<typShaMethod: 'instVarNames'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {String typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaBehavior >> mLookupSelector: aLookup [
	<typShaMethod: 'lookupSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mMethodNamed: aLookup [
	<typShaMethod: 'methodNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mMethods: aLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType copyWithParameters: {CompiledMethod typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mName: aLookup [
	<typShaMethod: 'name'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaBehavior >> mNew: aLookup [
	<typShaMethod: 'new'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			aLookup receiverType classDescription instanceSide typAsType typAsType
]

{ #category : #shadow }
TypShaPhaBehavior >> mSelectors: aLookup [
	<typShaMethod: 'selectors'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType copyWithParameters: {Symbol typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mSuperclass: aLookup [
	<typShaMethod: 'superclass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
]

{ #category : #shadow }
TypShaPhaBehavior >> mWhichClassDefinesClassVar: aLookup [
	<typShaMethod: 'whichClassDefinesClassVar:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Class typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mWhichClassDefinesInstVar: aLookup [
	<typShaMethod: 'whichClassDefinesInstVar:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mWithAllSuperclasses: aLookup [
	<typShaMethod: 'withAllSuperclasses'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {ClassDescription typAsType})
]
