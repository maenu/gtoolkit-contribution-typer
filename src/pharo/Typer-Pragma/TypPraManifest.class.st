Class {
	#name : #TypPraManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraManifest class >> shortName [
	^ 'pragma'
]
