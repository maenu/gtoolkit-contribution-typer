Class {
	#name : #TypVariableResolvers,
	#superclass : #TypResolvers,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypVariableResolvers >> initialize [
	<typTypeVariable: 'resolvers' as: 'OrderedCollection<TypResolver<Association<TypType,Symbol>>>'>
	super initialize
]

{ #category : #initialization }
TypVariableResolvers >> typeFor: anAssociation using: aBlock [
	<typTypeArgument: 1 as: 'Association<TypType,Symbol>'>
	<typTypeArgument: 2 as: 'BlockClosure<TypResolver<Association<TypType,Symbol>>,Association<TypType,Symbol>,TypType>'>
	<typTypeResultAs: 'TypType'>
	^ super typeFor: anAssociation using: aBlock
]

{ #category : #accessing }
TypVariableResolvers >> typeForVariable: anAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,Symbol>'>
	<typTypeResultAs: 'TypType'>
	^ self typeFor: anAssociation using: [ :r :a | r typeFor: anAssociation resolvedBy: a ]
]
