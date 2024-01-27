Class {
	#name : #TypCheManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheManifest class >> shortName [
	^ 'checker'
]
